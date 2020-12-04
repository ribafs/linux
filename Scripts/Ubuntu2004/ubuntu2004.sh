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
# "Instalar pacotes básicos.";
apt install -y apache2 libapache2-mod-php7.4 git mcrypt curl composer;

# "Instalar Apache e módulos.";

a2enmod rewrite;
systemctl restart apache2;

# Instalar SGBDs
apt install -y mariadb-server;

# "Instalar PHP 7.4 e extensões.";
apt install -y php7.4-xml php7.4-xsl php7.4-curl php7.4-xdebug php7.4-intl php7.4 php7.4-bcmath php7.4-mysql;
apt install -y php7.4-zip php7.4-mbstring php7.4-gettext php7.4-gd php-curl php-pear;

# "Instalar suporte a cache no PHP.";
apt install -y php-apcu;

wget http://ftp.ussg.iu.edu/linux/debian/pool/main/m/memcached/memcached_1.5.6-1.1_amd64.deb;
dpkg -i memcached_1.5.6-1.1_amd64.deb;
apt install -y php-memcache php-memcached;

systemctl restart apache2;

# "Efetuar update e upgrade do Sistema. Geralmente é necessário reboot, nos casos em que o kernel seja atualizado";
apt -y update;
apt -y upgrade;;
      0) clear;exit;;
   esac
done
