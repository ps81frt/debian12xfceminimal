#/usr/bin/bash


# Cleanup distro



sudo apt-get update -y && sudo apt-get upgrade -y        
sudo apt --fix-missing update -y        
sudo apt update -y        
sudo apt install -f -y        
sudo apt-get clean -y        
sudo apt-get autoclean -y        
sudo apt-get autoremove -y        
sudo apt clean
sudo apt -s clean
sudo apt clean all
sudo apt autoremove
sudo apt-get clean
sudo apt-get -s clean
sudo apt-get clean all
sudo apt-get autoclean

#Remove Old Log Files
sudo rm -f /var/log/*gz


# Remove Thumbnail Cache
rm -rf ~/.cache/thumbnails/*
rm -r -f ~/.local/share/Trash/*/*
find ~/.cache/thumbnails -type f -atime +7 -delete

dpkg -l | grep ^rc
dpkg -l | grep ^rc | cut -d' ' -f3 | xargs sudo dpkg -P

find ~/ -name '*~' -print0 
find ~/ -name '*~'
find ~/ -name '*~' -print0 | xargs -0 rm
sudo journalctl --vacuum-size=200M
echo SystemMaxUse=1G | sudo tee -a /etc/systemd/journald.conf
sudo systemctl restart systemd-journald.service

history -p
history -c

