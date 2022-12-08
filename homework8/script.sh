sudo yum -y auto_update

sudo yum install httpd -y 
sudo yum install mod_ssl -y 
sudo yum install firewalld 

sudo mkdir /var/www/ssl-test 
sudo cp -f /vagrant/index.html /usr/share/httpd/noindex/index.html

sudo systemctl enable firewalld #дозволяє, запускає, перевіряє firewall
sudo systemctl start firewalld
sudo firewall-cmd --state

sudo systemctl start httpd 
sudo systemctl enable httpd
sudo systemctl status httpd

sudo cp -f /vagrant/info.conf /etc/httpd/conf.d/

sudo apachectl configtest # перевіряється конфігурація на ерори
sudo systemctl reload httpd 

# добавляємо порти і перезагружаємо
sudo firewall-cmd --permanent --add-service=http 
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload

# генеруємо сертифікат
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/apache-selfsigned.key -out /etc/pki/tls/certs/apache-selfsigned.crt -subj "/C=UA/ST=Lvivska/L=Lviv/O=ITStep/OU=University/CN=127.0.0.1"