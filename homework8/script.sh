# Інсталюємо необхідні додатки
sudo yum -y update
sudo yum install httpd -y

yum install mod_ssl -y

sudo yum install firewalld 

# перекидуємо наш файлик html
sudo mkdir /var/www/ssl-test
sudo cp -f /vagrant/index.html /var/www/index.html

# відкриваємо http та https порти
sudo systemctl enable firewalld # дозволяє, запускає перевіряє фаєрвол
sudo systemctl start firewalld
sudo firewall-cmd --state

# Вмикаємо апаче
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd

#  Конфігурація
sudo cp -f /vagrant/local.conf /etc/httpd/conf.d/

sudo apachectl configtest
sudo systemctl reload httpd


# Порти
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/private/apache-selfsigned.key -out /etc/pki/tls/certs/apache-selfsigned.crt -subj "/C=UA/ST=Lvivska/L=Lviv/O=ITStep/OU=University/CN=127.0.0.1"