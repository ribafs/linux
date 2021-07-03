#!/bin/bash
#
# Criado/adaptado por Ribamar FS - http://ribafs.org
#
apt install dialog;
#
while :
 do
    clear
servico=$(dialog --stdout --backtitle 'Instalação de pacotes no Ubuntu Server 16.04 LTS - 64' \
                --menu 'Selecione a opção com a seta ou o número e tecle Enter\n' 0 0 0 \
                2 'Instalar LAMP e outros' \
                0 'Sair' )
    case $servico in
      2) clear;
apt update;
# "Instalar pacotes básicos. Tecle Enter para instalar!";
apt install -y apache2 libapache2-mod-php7.0 aptitude git mc;

# "Instalar Apache e módulos. Tecle Enter para instalar!";

a2enmod rewrite;

# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
apt install -y postgresql mysql-server;

# "Instalar PHP 7 e extensões. Tecle Enter para instalar!";
apt install -y php7.0-bcmath php7.0 mcrypt php-mcrypt php7.0-gd php7.0-mysql php7.0-sqlite3 php7.0-pgsql;
apt install -y php7.0-mcrypt php-pear php7.0-xml  php7.0-xsl curl php7.0-curl phpunit php-xdebug php7.0-intl composer;
apt install -y php7.0-zip php7.0-mbstring php-gettext php-mbstring php7.0-fpm phpmyadmin;
apt install -y php-curl php-mcrypt php-gd;
phpenmod mbstring

# "Instalar suporte a cache no PHP. Tecle Enter para instalar!";
# Cache de php
apt install -y php-apcu;

wget http://ftp.ussg.iu.edu/linux/ubuntu/pool/main/m/memcached/memcached_1.4.25-2ubuntu1_amd64.deb;
dpkg -i memcached_1.4.25-2ubuntu1_amd64.deb;
apt install -y php-memcache;

service apache2 restart;

apt install -y zip unzip p7zip-full k3b kolourpaint4 gnome-search-tool shutter;

# Autocorreção no Libreoffice
apt install hunspell-pt-br alarm-clock-applet;
apt install libreoffice-l10n-pt-br vokoscreen shutter;
apt install dconf-editor searchmonkey;

# "Efetuar update e upgrade do Sistema. Algumas vezes é necessário reboot";
apt -y update;
apt -y upgrade;;
      0) clear;exit;;
   esac
done
