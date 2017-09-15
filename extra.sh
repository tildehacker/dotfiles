#!/usr/bin/env bash

# Echo every command
set -x

# This script's dirpath
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Update apt packages index and upgrade
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# Install web browsers
sudo apt-get -y install chromium torbrowser-launcher 

# Install desktop utilities
sudo apt-get -y install ranger zathura scrot 

# Install system utilities
sudo apt-get -y install screenfetch htop vrms apg zip unzip unrar pv 

# Install geeky utilities
sudo apt-get -y install cmatrix cowsay

# Install network utilities
sudo apt-get -y install nmap tshark rtorrent openssh-client openssh-server

# Install multimedia utilities
sudo apt-get -y install libavcodec-extra mpv mpd ncmpcpp mtp-tools jmtpfs

# Install programming utilities
sudo apt-get -y install git virtualenv swi-prolog build-essential default-jdk tomcat8 gradle 

# Install LAMP stack
sudo apt-get -y install apache2 mysql-server mysql-client php5 php5-mysql libapache2-mod-php5 phpmyadmin

# Install office utilities
#sudo apt-get -y install unoconv libimage-exiftool-perl texlive markdown libreoffice libreoffice-gtk 

# Install image manipulation utilities
#sudo apt-get -y install imagemagick gimp inkscape 

# Install Sublime Text 3
# Sublime Text is a proprietary software
# See https://www.sublimetext.com/ for details
if ! dpkg -l | grep -q sublime-text ; then
    wget "https://download.sublimetext.com/sublime-text_build-3126_amd64.deb" -O /tmp/sublime-text.deb
    sudo dpkg --install /tmp/sublime-text.deb
    rm /tmp/sublime-text.deb
    sudo apt-get -y install -f

    # Install Package Control
    mkdir -p "${HOME}/.config/sublime-text-3/Installed Packages"
    wget "https://packagecontrol.io/Package%20Control.sublime-package" -O "${HOME}/.config/sublime-text-3/Installed Packages/Package Control.sublime-package"
fi

# Install Popcorn Time
# Popcorn Time is available under the terms of the GPL-3.0
# See https://github.com/popcorn-official/popcorn-desktop for details
if ! [ $(which Popcorn-Time) ]; then
    sudo apt-get -y install libgconf-2-4 xz-utils
    wget "https://get.popcorntime.sh/build/Popcorn-Time-0.3.10-Linux-64.tar.xz" -O /tmp/Popcorn-Time-0.3.10-Linux-64.tar.xz
    sudo tar -xf /tmp/Popcorn-Time-0.3.10-Linux-64.tar.xz -C /usr/local/bin/
    rm /tmp/Popcorn-Time-0.3.10-Linux-64.tar.xz
fi

# Install TeamViewer
# TeamViewer is a proprietary software
# See https://www.teamviewer.com for details
if ! dpkg -l | grep -q teamviewer ; then
    wget "https://download.teamviewer.com/download/teamviewer_i386.deb" -O /tmp/teamviewer_i386.deb
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo dpkg --install /tmp/teamviewer_i386.deb
    rm /tmp/teamviewer_i386.deb
    sudo apt-get -y install -f
fi

# Generate ssh key
if ! [ -d "${HOME}/.ssh/" ]; then
    ssh-keygen
fi
