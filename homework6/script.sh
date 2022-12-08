sudo -i
pvcreate /dev/sdc /dev/sdd /dev/sde /dev/sdf #свторення фізичних дисків
vgcreate vg01 /dev/sdc /dev/sdd /dev/sde /dev/sdf #створюємо вольюм групу назвою vg01 з фізичних дисків

#створюємо 2 частинки на 600 мб
lvcreate -l 100%FREE vg01 /dev/sdc /dev/sdd -n lv0 
lvcreate -l 100%FREE vg01 /dev/sde /dev/sdf -n lv1 
 
#форматування
mkfs.ext4 /dev/vg01/lv0
mkfs.ext4 /dev/vg01/lv1

#монтуємо
mkdir /mnt/vol1 /mnt/vol2 
echo "/dev/vg01/lv0 /mnt/vol1 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/vg01/lv1 /mnt/vol2 ext4 defaults 0 0" >> /etc/fstab
mount -a