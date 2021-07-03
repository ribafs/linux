#!/bin/bash
#
# Criado/adzypperado por Ribamar FS - http://ribafs.org
#
zypper install -y dialog;
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
      1) zypper update;;
      2) clear;
# "Instalar pacotes básicos. Tecle Enter para instalar!";
zypper install -y apache2 apache2-mod_php7 git mc nano wget yast2;
systemctl enable apache2;

# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
zypper install -y mariadb mariadb-client mariadb-tools;
systemctl enable mysql;

# "Instalar PHP 7 e extensões. Tecle Enter para instalar!";
zypper install -y php7 php7-bcmath php7-gd php7-mysql php7-curl php7-pear php7-xsl curl php7-xdebug php7-intl;
zypper install -y php7-zip php7-mbstring php-gettext php-mbstring php7-fpm php-composer;
a2enmod php7;
systemctl restart apache2;

# "Instalar suporte a cache no PHP. Tecle Enter para instalar!";
zypper install -y php-apcu;

a2enmod rewrite;
sudo systemctl start apache2;

zypper update;;
      0) clear;exit;;
   esac
done
