#OS and version, release number, kernel version
echo $(lsb_release -a)

#all available shells
cat /etc/shells

#Computer CPU information like processor type, speed etc
echo $(sudo dmidecode -t 4)

#memory information
echo $(free -m)

#hard disk information like size of hard disk, cache memory, model 
echo $(sudo dmidecode -t memory)

#File system (Mounted)
echo $(sudo fdisk -l)
