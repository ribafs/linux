#!/bin/bash
#
# Criado/adaptado por Ribamar FS - http://ribafs.org
#
apt install -y dialog;
# https://www.cyberciti.biz/faq/how-to-install-lamp-on-debian-10-buster/
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
apt install -y apache2 libapache2-mod-php aptitude git composer mc curl phpunit;

# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
# apt install -y mysql-server postgresql sqlite3;
apt install -y mariadb-server;

# "Instalar PHP 7 e extensões. Tecle Enter para instalar!";
apt install -y php7.3 php7.3-bcmath php7.3-gd php7.3-mysql php7.3-pgsql php7.3-sqlite3 php7.3-curl;
apt install -y php-pear php7.3-xml php7.3-xsl php-xdebug php7.3-intl;
apt install -y php7.3-zip php7.3-mbstring php-gettext php7.3-fpm;
phpenmod mbstring;

# "Instalar suporte a cache no PHP. Tecle Enter para instalar!";
apt install -y php-apcu;

wget http://spout.ussg.indiana.edu/linux/ubuntu/pool/main/m/memcached/memcached_1.5.22-2ubuntu0.1_amd64.deb;
dpkg -i memcached_1.5.22-2ubuntu0.1_amd64.deb;
apt install -y php-memcache;

a2enmod rewrite;
systemctl restart apache2;

# Instalar outros softwares
apt install -y ttf-mscorefonts-installer fonts-crosextra-carlito fonts-crosextra-caladea searchmonkey;
apt install -y rar unrar zip unzip p7zip-full ubuntu-restricted-extras kolourpaint;
add-apt-repository ppa:linuxuprising/shutter && apt update && apt install;
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt install -y nodejs

# Ajustar relógio se em dual-boot
#timedatectl set-local-rtc 1 --adjust-system-clock;

apt update;
apt upgrade -y;;
      0) clear;exit;;
   esac
done
