#!/usr/bin/env bash

# Echo every command
set -x

# dotfiles installation steps:
#	Install debian netinst base system
#	Install git
#	Clone dotfiles
#	Run this script
#	Optional: run ./extra.sh

# Tools list (extra.sh tools included):
#	Window manager: i3
#	Web browser: chromium
#	Network manager: network-manager
#	Terminal emulator: urxvt
#	Terminal multiplexer: tmux
#	Text editor: vim
#	Shell: bash
#	Image viewer: feh
#	File manager: ranger
#	Document viewer: zathura	
#	BitTorrent client: rtorrent
#	Process viewer: htop
#	System information: screenfetch
#	Network exploration: nmap
#	Network traffic analyzer: tshark
#	Anonymous web browsing: torbrowser
#	Non-free packages detector: vrms
#	Screenshot utility: scrot
#	Image manipulation suite: imagemagick, gimp, inkscape
#	Document converter: unoconv
#	Meta information editor: exiftool
#	Program launcher: rofi
#	Codec library: libavcodec
#	Version control system: git
#	Random password generation: apg
#	LaTeX suite: texlive
#	Markdown: markdown
#	LAMP stack: apache2, php5, mysql, phpmyadmin
#	Archive utilities: zip, unzip, unrar, xz-utils
#	Python: virtualenv
#	Prolog interpreter: swi-prolog
#	C/C++: build-essential
#	Office suite: libreoffice, libreoffice-gtk
#	Video player: mpv
#	Audio player: mpd+ncmpcpp
#	Movies streaming: Popcorn Time
#	Remote control: TeamViewer
#	Java: default-jdk, tomcat8, gradle
#	Pipe viewer: pv

# This script's dirpath
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Copy/paste apt sources.list
sudo cp ${SCRIPTPATH}/etc/apt/sources.list /etc/apt/
#	Update apt packages index and upgrade
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# Install required packages
#	Install non-free drivers
sudo apt-get -y install broadcom-sta-dkms firmware-realtek
#	Install i3
sudo apt-get -y install xorg i3
#	Install network-manager (+ i3 config)
sudo apt-get -y install network-manager
#	Install screen brightness utility (i3 config)
sudo apt-get -y install xbacklight
#	Install sound (+ i3 config)
sudo apt-get -y install alsa-base alsa-utils
#	Install terminal emulator (+ i3 config)
sudo apt-get -y install rxvt-unicode-256color
#	Install unclutter for mouse (i3 config)
sudo apt-get -y install unclutter
#	Install feh image viewer (+ i3 config desktop background)
sudo apt-get -y install feh
#	Install compton for windows opacity (i3 config)
sudo apt-get -y install compton
#	Install i3blocks (i3 config)
sudo apt-get -y install i3blocks
#	Install xwrits for micro pause (i3 config)
sudo apt-get -y install xwrits
#	Install text editor (vim-gtk for X clipboard support)
sudo apt-get -y install vim-gtk
#	Install powerline for bash, vim and tmux
sudo apt-get -y install powerline
#	Install xclip for tmux copy/paste to/from system clipboard
sudo apt-get -y install xclip
#	Install tmux (+ i3 config)
sudo apt-get -y install tmux
#	Install xautolock to auto lock X (+ i3 config)
#sudo apt-get -y install xautolock
#	Replace xautolock by xss-lock on 20161228
sudo apt-get -y install xss-lock

# Install Arc theme
# Arc is available under the terms of the GPL-3.0
# See https://github.com/horst3180/arc-theme for details
if ! dpkg -l | grep -q arc-theme ; then
    wget "http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/all/arc-theme_1480088096.9047b20_all.deb" -O /tmp/arc-theme.deb
    sudo dpkg --install /tmp/arc-theme.deb
    rm /tmp/arc-theme.deb
    sudo apt-get -y install -f
fi

# Install Moka icons
# Faba is available under the terms of the GPL
# See https://github.com/snwh/faba-icon-theme for details
if ! dpkg -l | grep -q faba-icon-theme ; then
    wget "https://snwh.org/paper/download.php?owner=moka&ppa=daily&pkg=faba-icon-theme,16.04" -O /tmp/faba-icon-theme.deb
    sudo dpkg --install /tmp/faba-icon-theme.deb
    rm /tmp/faba-icon-theme.deb
    sudo apt-get -y install -f
fi
# Moka is available under the terms of the GPL
# See https://github.com/snwh/moka-icon-theme for details
if ! dpkg -l | grep -q moka-icon-theme ; then
    wget "https://snwh.org/paper/download.php?owner=moka&ppa=daily&pkg=moka-icon-theme,16.04" -O /tmp/moka-icon-theme.deb
    sudo dpkg --install /tmp/moka-icon-theme.deb
    rm /tmp/moka-icon-theme.deb
    sudo apt-get -y install -f
fi

# Install Rofi
# Rofi is available under the terms of the MIT/X11 License
# See https://github.com/DaveDavenport/rofi for details
if ! [ $(which rofi) ]; then
    sudo apt-get -y install libpango1.0-dev libpangocairo-1.0-0 libcairo2-dev libglib2.0-dev libstartup-notification0-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb1-dev libxinerama-dev
    wget "https://github.com/DaveDavenport/rofi/releases/download/0.15.12/rofi-0.15.12.tar.gz" -O /tmp/rofi.tar.gz
    tar -xzf /tmp/rofi.tar.gz -C /tmp/
    rm /tmp/rofi.tar.gz
    mv /tmp/rofi-0.15.12 /tmp/rofi
    ( cd /tmp/rofi/ && ./configure )
    ( cd /tmp/rofi/ && make )
    ( cd /tmp/rofi/ && sudo make install )
    rm -rf /tmp/rofi/
fi

# Install powerline for vim
mkdir -p ${HOME}/.vim/plugin/
cp /usr/share/vim/addons/plugin/powerline.vim ${HOME}/.vim/plugin/

# Create custom folders for vim
mkdir -p ${HOME}/.vim/backup/
mkdir -p ${HOME}/.vim/undo/

# Copy/paste conf files
#	Copy rc.local
sudo cp ${SCRIPTPATH}/etc/rc.local /etc/
#	Copy synaptics.conf
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo cp ${SCRIPTPATH}/etc/X11/xorg.conf.d/synaptics.conf /etc/X11/xorg.conf.d/
#	Copy dotfiles to home dir
cp -R ${SCRIPTPATH}/{.bashrc,.config/,.fehbg,.fonts/,.gtkrc-2.0,.i3/,Pictures/,.profile,.tmux.conf,.vim/,.vimrc,.xinitrc,.Xresources} ${HOME}
#	Disable eth0 in /etc/network/interfaces for network-manager
sudo cp ${SCRIPTPATH}/etc/network/interfaces /etc/network/
#	Handle poweroff button and lid switch actions on 20161228
sudo cp ${SCRIPTPATH}/etc/systemd/logind.conf /etc/systemd/
