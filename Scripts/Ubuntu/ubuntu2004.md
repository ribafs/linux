sudo nano /etc/php/7.4/apache2/php.ini

display_error = On
error_reporting = E_ALL # comentar o existente
output_buffering = On

sudo nano /etc/apache2/apache2.conf

ServerName localhost

Mudar as ocorrenciasn de 
AllowOverride none
Para
AllowOverride All

<Directory />
    Options Indexes FollowSymLinks Includes ExecCGI
    AllowOverride All
    Order deny,allow
    Allow from all
</Directory>

sudo service apache2 restart

== Executar comandos com sudo sem que seja exigida a senha
Executar no terminal

sudo bash -c 'echo "$(logname) ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)'


== Configurar mysql resetaando senha root. Mas antes testar se já funciona normalmente

sudo mysql -uroot
USE mysql;
UPDATE user SET plugin='mysql_native_password' WHERE User='root';
UPDATE user SET authentication_string=PASSWORD("root") WHERE User='root';
FLUSH PRIVILEGES;
exit;

sudo service mysql restart
mysql -uroot -proot


== Instalar nodejs 12
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs


