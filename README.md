# ubuntu-fresh-startup

## Packages

* vscode (.deb package 64-bit)
    * direct download link https://go.microsoft.com/fwlink/?LinkID=760868
    * `sudo apt install ./<file>.deb`
    *   ~~~
        cd ~/Downloads/
        wget --content-disposition https://go.microsoft.com/fwlink/?LinkID=760868
        sudo apt install `ls -1 -t code_*.deb* | head -n 1`
        ~~~
    * ( source https://code.visualstudio.com/docs/setup/linux )
* "Open in Code"
    *   ~~~
        wget -qO- https://raw.githubusercontent.com/cra0zy/code-nautilus/master/install.sh | bash
        ~~~
    * ( source https://askubuntu.com/questions/1049111/add-open-with-vscode-to-context-menu-in-ubuntu )
* nvm
    *   ~~~
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
        ~~~
    * ( source https://github.com/nvm-sh/nvm )

<!-- ## Install Extension

~~~
wget -qO- https://raw.githubusercontent.com/anniehastur450/ubuntu-fresh-startup/master/install.sh | bash
~~~ -->

## Ubuntu System Settings

<!-- * Region & Languages  (other than that)
    * "Formats" to United States (Need Restart)
    *   ~~~
        gsettings set org.gnome.system.locale region 'en_US.UTF-8'
        ~~~ -->

* Power
    * "Blank Screen" to Never
    *   ~~~
        gsettings set org.gnome.desktop.session idle-delay 0
        ~~~


* how to find gsettings key
    * ( source https://askubuntu.com/questions/971067/how-can-i-script-the-settings-made-by-gnome-tweak-tool )
    * `dconf watch /`

## Ubuntu Symptoms Diagnosis

* Symptoms: VirtualBox with Mouse Integration, cannot scroll while mouse is moving

    * ( solution source https://forums.virtualbox.org/viewtopic.php?f=3&t=79002&start=15#p464631 )
    * `xinput list`
    * Use "VirtualBox USB Tablet", and disable "VirtualBox Mouse Integration"
    * Persist solution (across reboots)
        ~~~
        sudo mkdir -p /etc/X11/xorg.conf.d
        echo 'Section "InputClass"
                Identifier "Fix VBox scroll wheel"
                MatchProduct "VirtualBox mouse integration"
                Option "Ignore" "on"
        EndSection' | sudo tee /etc/X11/xorg.conf.d/40-vbox-fix.conf
        ~~~

* Wheel speed adjust

    * ( source https://askubuntu.com/questions/255890/how-can-i-adjust-the-mouse-scroll-speed )
    * `sudo apt install imwheel`
    *   ~~~
        wget -qO- https://raw.githubusercontent.com/anniehastur450/ubuntu-fresh-startup/master/mousewheel.sh | bash
        ~~~
    * Persist solution across reboots see source

* VirtualBox 7.0.2 Unattended Installation Ubuntu 22.04

    * Symptoms 1: Cannot open terminal
        * ( solution source https://askubuntu.com/questions/1435918/terminal-not-opening-on-ubuntu-22-04-on-virtual-box-7-0-0 )
        * Try to adjust "Region & Languages" until you see /etc/default/locale changed

    * Symptoms 2: Not in the sudoers file
        * (do not know solution, avoid using unattended installation for now)
