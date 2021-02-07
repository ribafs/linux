#!/bin/bash
#
# Criado/adaptado por Ribamar FS - http://ribafs.org
#
#
clear;
apt update;
# "Instalar pacotes básicos.";
apt install -y apache2 libapache2-mod-php7.4 git mcrypt curl composer aptitude;

# "Instalar Apache e módulos.";

a2enmod rewrite;
systemctl restart apache2;

# Instalar SGBDs
apt install -y mariadb-server postgresql sqlite3;

# "Instalar PHP 7.4 e extensões.";
apt install -y php7.4-xml php7.4-xsl php7.4-curl php7.4-xdebug php7.4-intl php7.4 php7.4-bcmath php7.4-mysql php7.4-pgsql php7.4-sqlite3;
apt install -y php7.4-zip php7.4-mbstring php7.4-gettext php7.4-gd php-curl php-pear php-apcu;

wget http://ftp.ussg.iu.edu/linux/debian/pool/main/m/memcached/memcached_1.5.6-1.1_amd64.deb;
dpkg -i memcached_1.5.6-1.1_amd64.deb;
apt install -y php-memcache php-memcached;
rm memcached_1.5.6-1.1_amd64.deb;

wget http://spout.ussg.indiana.edu/linux/ubuntu/pool/main/m/memcached/memcached_1.6.6-3ubuntu1_amd64.deb;
dpkg -i memcached_1.6.6-3ubuntu1_amd64.deb;
apt install -y php-memcache;

a2enmod rewrite;
systemctl restart apache2;

# Instalar outros softwares
apt install -y ttf-mscorefonts-installer fonts-crosextra-carlito fonts-crosextra-caladea kazam openshot peek alarm-clock-applet;
apt install -y rar unrar zip unzip p7zip-full ubuntu-restricted-extras kolourpaint searchmonkey net-tools samba;

# Ajustar relógio se em dual-boot
#timedatectl set-local-rtc 1 --adjust-system-clock;


# "Efetuar update e upgrade do Sistema. Geralmente é necessário reboot, nos casos em que o kernel seja atualizado";
apt -y update;
apt autoremove -y;
apt -y upgrade;;

