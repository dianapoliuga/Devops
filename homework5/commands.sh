while true 
do 
if [ -n "$(ls -A /home/folder1)" ]; then 
mv /home/folder1/*.* /home/folder2/ 
fi 
done