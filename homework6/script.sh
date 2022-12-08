sudo -i
pvcreate /dev/sdc /dev/sdd /dev/sde /dev/sdf #створюємо фізичні диски
vgcreate vg01 /dev/sdc /dev/sdd /dev/sde /dev/sdf #створюємо вольюм групу з фізичних дисків


#створюємо 2 частинкb на 600 мб з вольюм групи
lvcreate -l 100%FREE vg01 /dev/sdc /dev/sdd -n lv0 
lvcreate -l 100%FREE vg01 /dev/sde /dev/sdf -n lv1 


#форматуємо
mkfs.ext4 /dev/vg01/lv0
mkfs.ext4 /dev/vg01/lv1

#створюємо папки для монтування
mkdir /mnt/vol1 /mnt/vol2


     #що           #куди    #тип ф.с #ключики #службові поля 
echo "/dev/vg01/lv0 /mnt/vol1 ext4 defaults 0 0" >> /etc/fstab
echo "/dev/vg01/lv1 /mnt/vol2 ext4 defaults 0 0" >> /etc/fstab

mount -a