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
apt install -y apache2 libapache2-mod-php5 aptitude git mc curl phpunit;
apt install php5-cli;
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer;

# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
# apt install -y mysql-server postgresql sqlite;
apt install -y mariadb-server;

# "Instalar PHP 7 e extensões. Tecle Enter para instalar!";
# apt install -y php5 php5-bcmath php5-gd php5-mysql php5-pgsql php5-pdo-pgsql php5-sqlite php5-curl;
apt install -y php5 php5-bcmath php5-gd php5-mysql php5-pdo-mysql php5-curl;
apt install -y php-pear php5-xml php5-xsl php-xdebug php5-intl;
apt install -y php5-zip php5-mbstring php-gettext php5-fpm;
phpenmod mbstring;

# "Instalar suporte a cache no PHP. Tecle Enter para instalar!";
apt install -y php-apcu;

a2enmod rewrite;
systemctl restart apache2;

apt update;
apt upgrade -y;;
      0) clear;exit;;
   esac
done
