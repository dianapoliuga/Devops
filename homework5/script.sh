sudo -i
cd /home
mkdir folder1
mkdir folder2

cp /vagrant/commands.sh /home/commands.sh
chmod +x /home/commands.sh


cp /vagrant/move.service /lib/systemd/system/move.service


systemctl daemon-reload
systemctl start move.service
systemctl enable move.service