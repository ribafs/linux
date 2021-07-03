#!/bin/bash
#
# Criado/adaptado por Ribamar FS - http://ribafs.org
#
apt-get install dialog;
#
while :
 do
    clear
servico=$(dialog --stdout --backtitle 'Instalação de pacotes no Ubuntu Server 14.04 LTS - 64' \
                --menu 'Selecione a opção com a seta ou o número e tecle Enter\n' 0 0 0 \
                1 'Atualizar repositórios' \
                2 'Instalar Servidor Web e cia' \
                3 'Efetuar o Upgrade da distribuição' \
                0 'Sair' )
    case $servico in
      1) apt-get update;;
      2) clear;
echo "Instalar pacotes básicos. Tecle Enter para instalar!";
apt-get -y install aptitude unzip ntp ntpdate git;

clear;
echo "Instalar Apache e módulos. Tecle Enter para instalar!";
apt-get -y install apache2 libapache2-mod-php5;
a2enmod rewrite;

clear;
# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
apt-get -y install mysql-server;

clear;
echo "Instalar PHP 5 e extensões. Tecle Enter para instalar!";
apt-get -y install php5 mcrypt php5-mcrypt php5-gd php5-mysql php5-sqlite php5-pgsql php5-ldap;
apt-get -y install php5-mcrypt php-pear php5-xsl curl php5-curl phpunit php5-xdebug php5-intl;
apt-get -y install php-gettext php5-fpm php-auth;

clear;
echo "Instalar suporte a cache no PHP. Tecle Enter para instalar!";
# Cache de php
apt-get -y install php5-apcu;
apt-get -y install memcached php5-memcache;

addgroup webdevel;
adduser www-data webdevel;
adduser ribafs webdevel;

echo "Setar permissões para /var/www/html/\$1

clear;
echo \"Aguarde enquanto configuro as permissões do /var/www/html/\$1\";
echo \"\";
chown -R www-data:webdevel /var/www/html/\$1;
chmod -R g+s /var/www/html/\$1;
#chmod -R u+s /var/www/html/\$1;
#chgrp -R webdevel /var/www/html/$1
find /var/www/html/\$1 -type d -exec chmod 2775 {} \;
find /var/www/html/\$1 -type f -exec chmod 2664 {} \;
echo \"\";
echo \"Concluído!\";

Selecionar o código acima
Tecle Enter e cole com Shift+Insert.
";
read n;

nano /usr/local/bin/perms;
chmod +x /usr/local/bin/perms;;

	  3) clear;
echo "Efetuar update e upgrade do Sistema. Algumas vezes é necessário reboot.
Geralmente após a instalação.
Tecle Enter.";

apt-get -y update;
apt-get -y upgrade;;
      0) clear;exit;;
   esac
done
