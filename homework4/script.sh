sudo useradd -p '$6$abcdefg$lbWCKkgPgMHaAcGhZxsMYVIS852rWJhiKr/Az1xews4Iazp0Yuj9hpwLD08juvhu03RbbaGEBC75.lAPt5GMR0' adminuser
sudo usermod -aG sudo adminuser
sudo useradd -m poweruser
sudo passwd -d poweruser
echo "poweruser ALL=(ALL:ALL) /usr/sbin/iptables" >> /etc/sudoers
sudo usermod -aG adminuser poweruser
ln -s /etc/mtab /home/poweruser/link