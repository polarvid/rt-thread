
mount sd.bin root/
rm -r root/*
cp -r /home/rtthread-smart/userapps/root/bin/aarch64/* root/
umount root/
sync
