#!/bin/bash
#
# Criado/adaptado por Ribamar FS - http://ribafs.org
#
apt install -y dialog;
#
while :
 do
    clear
servico=$(dialog --stdout --backtitle 'Instalação de pacotes no Ubuntu Server 16.04 LTS - 64' \
                --menu 'Selecione a opção com a seta ou o número e tecle Enter\n' 0 0 0 \
                1 'Atualizar repositórios' \
                2 'Instalar LAMP e outros' \
                0 'Sair' )
    case $servico in
      1) apt update;;
      2) clear;
# "Instalar pacotes básicos. Tecle Enter para instalar!";
apt install -y apache2 libapache2-mod-php7.2 aptitude git mc;

# "Instalar Apache e módulos. Tecle Enter para instalar!";

a2dismod php7.2;
a2enmod rewrite;

# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
apt install -y mysql-server postgresql;

# "Instalar PHP 7 e extensões. Tecle Enter para instalar!";
apt install -y php7.2-bcmath php7.2 mcrypt php7.2-gd php7.2-mysql php7.2-pgsql php7.2-sqlite;
apt install -y php7.2-mcrypt php-pear php7.2-xml  php7.2-xsl curl php7.2-curl phpunit php-xdebug php7.2-intl composer;
apt install -y php7.2-zip php7.2-mbstring php-gettext php-mbstring php7.2-fpm;
phpenmod mbstring;

# "Instalar suporte a cache no PHP. Tecle Enter para instalar!";
apt install -y php-apcu;

wget http://ftp.ussg.iu.edu/linux/ubuntu/pool/main/m/memcached/memcached_1.5.6-1_amd64.deb;
dpkg -i memcached_1.5.6-1_amd64.deb;
apt install -y php-memcache;

echo "Configurar php (display_errors = On)
date.timezone = America/Fortaleza
Aperte ENTER para abrir o php.ini";

nano /etc/php/7.2/apache2/php.ini;
service apache2 restart;

clear;

echo "Configurar .htaccess no Apache 2.4 trocando None por All
<Directory />
    Options Indexes FollowSymLinks Includes ExecCGI
    AllowOverride All
    Order deny,allow
    Allow from all
</Directory>

ServerName localhost

Adicionar ao final:
<FilesMatch \.php$>
SetHandler application/x-httpd-php
</FilesMatch>";
echo "";
echo "";
echo "Qualuer tecla para continuar";
read n;

nano /etc/apache2/apache2.conf;

a2dismod php7.0
a2enmod php7.2
systemctl restart apache2

#Configurar Firefox para acessar Banco do Brasil
apt install -y icedtea-plugin;

apt install -y ttf-mscorefonts-installer;
apt install -y rar unrar zip unzip p7zip-full ubuntu-restricted-extras k3b kolourpaint shutter;

apt update;
apt upgrade -y;;
      0) clear;exit;;
   esac
done
