#!/bin/bash
# install.sh is used to update webserver install git, make adjustments to crontab, set file permissions for hellminer.
nproc=$(nproc --all)
sudo apt-get update -y
sudo apt-get install git screen
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /$USER/hellminer/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
sudo chmod +x hellminer
sudo chmod +x mine.sh
sudo chmod +x verus-solver
