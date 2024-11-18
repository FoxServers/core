#!/bin/sh
echo "Backing up smb config..."
sudo cp -pf /etc/samba/smb.conf /etc/samba/smb.conf.bak
echo "Creating server folder..."
sudo mkdir -p /srv/server
sudo chmod a+rwx /srv/server
echo "Editing smb config to include new folder..."
echo "[Server]\n  path = /srv/server\n  browseable = yes\n  guest ok = no\n  writeable = yes\n  read only = no\n  valid users = @smb" >> /etc/samba/smb.conf
echo "Updating firewall settings..."
sudo ufw allow samba
echo "Creating smb user..."
CURRENT_USER=$(whoami)
sudo addgroup smb
sudo adduser "$CURRENT_USER" smb
read -p "Enter your name [$CURRENT_USER]: " USER
USER="${USER:-$CURRENT_USER}"
sudo smbpasswd -a "$USER"
echo "Updating folder permissions..."
sudo chmod -R 0770 /srv/server
sudo chown root:smb /srv/server
echo "Restarting smb service..."
sudo service smbd restart