#!/bin/bash
#
# Criado/adaptado por Ribamar FS - http://ribafs.org
#
apt-get install dialog;
#
while :
 do
    clear
servico=$(dialog --stdout --backtitle 'Instalação de pacotes no Ubuntu Server 16.04 LTS - 64' \
                --menu 'Selecione a opção com a seta ou o número e tecle Enter\n' 0 0 0 \
                1 'Instalar Servidor LEMP' \
                0 'Sair' )
    case $servico in
      1) clear;
apt update;
apt-get -y install aptitude unzip git;

apt-get -y install nginx;

# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
apt-get -y install mysql-server;

# "Instalar PHP 7 e extensões. Tecle Enter para instalar!";
apt-get -y install php7.0 php7.0-fpm mcrypt php7.0-mcrypt php7.0-gd php7.0-mysql;
apt-get -y install php7.0-mcrypt php-pear php7.0-xsl curl php7.0-curl phpunit php-xdebug php7.0-intl composer php7.0-xml;
apt-get -y install php7.0-zip php7.0-mbstring php-gettext php-mbstring php7.0-fpm php-auth phpmyadmin;
apt-get install php-curl php-mcrypt php-gd;
phpenmod mbstring;

# "Instalar suporte a cache no PHP. Tecle Enter para instalar!";
apt-get -y install php-apcu;

wget http://ftp.ussg.iu.edu/linux/ubuntu/pool/main/m/memcached/memcached_1.4.25-2ubuntu1_amd64.deb;
dpkg -i memcached_1.4.25-2ubuntu1_amd64.deb;
apt-get -y install php-memcache;

service nginx restart;

sudo apt-get install msttcorefonts;
apt-get -y install rar unrar zip unzip p7zip-full aptitude ubuntu-restricted-extras k3b kolourpaint4 gnome-search-tool;

apt-get -y update;
apt-get -y upgrade;;
      0) clear;exit;;
   esac
done
