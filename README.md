dotfiles
========

Packages list
-------------

* Window manager: **i3**
* Web browser: **chromium**
* Network manager: **network-manager**
* Terminal emulator: **urxvt**
* Terminal multiplexer: **tmux**
* Text editor: **vim**
* Shell: **bash**
* Image viewer: **feh**
* File manager: **ranger**
* Document viewer: **zathura**
* BitTorrent client: **rtorrent**
* Process viewer: **htop**
* System information: **screenfetch**
* Network exploration: **nmap**
* Network traffic analyzer: **tshark**
* Anonymous web browsing: **torbrowser**
* Non-free packages detector: **vrms**
* Screenshot utility: **scrot**
* Image manipulation suite: **imagemagick**, **gimp**, **inkscape**
* Document converter: **unoconv**
* Meta information editor: **exiftool**
* Program launcher: **rofi**
* Codec library: **libavcodec**
* Version control system: **git**
* Random password generation: **apg**
* LaTeX suite: **texlive**
* Markdown: **markdown**
* LAMP stack: **apache2**, **php5**, **mysql**, **phpmyadmin**
* Archive utilities: **zip**, **unzip**, **unrar**, **xz-utils**
* Python: **virtualenv**
* Prolog interpreter: **swi-prolog**
* C/C++: **build-essential**
* Office suite: **libreoffice**, **libreoffice-gtk**
* Video player: **mpv**
* Audio player: **mpd**+**ncmpcpp**
* Movies streaming: **Popcorn Time**
* Remote control: **TeamViewer**
* Java: **default-jdk**, **tomcat8**, **gradle**
* Pipe viewer: **pv**

Known issues
------------

* *tmux* copy/paste to/from system clipboard when using multiple sessions

Things you may need to change
-----------------------------

* dpi and monitors names in .xinitrc
* Drivers in install.sh
* Add or delete extra packages in extra.sh

Installation instructions
-------------------------

1. Install debian netinst base system
2. Install git
3. Clone dotfiles to local machine
4. Read and edit install.sh and extra.sh
5. Run

		$ ./install.sh 2>&1 | tee -a ~/dotfiles.log
		$ ./extra.sh 2>&1 | tee -a ~/dotfiles.log # Optional

How to use
----------

### i3

* Start *i3* using

		$ startx

* Stop *i3* using

		$ kill `pidof X`

* Read [i3 User's Guide](https://i3wm.org/docs/userguide.html)
* Read ~/.i3/config for custom shortcuts and behaviors

### rofi

* Run apps using Alt+d shotcut

### tmux

* For default key bindings, run:

		$ man tmux

* To begin selection use Ctrl+b followed by [
* To select text use v
* To copy use y or Y
* To paste use Ctrl+b followed by p or P

### vim

* Read ~/.vimrc
