# Install Samba Server on Raspberry Pi

## Install Samba server using apt-get

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install samba samba-common-bin
```

## Create your shared directory

```bash
cd ~/
mkdir shared
```

## Configure Samba to share your directory

```bash
# Backup samba configuration
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.orgi

# Add the following section of code to smb.conf
sudo vi /etc/samba/smb.conf

[shared]
   comment = The shared folder
   path = /home/pi/shared
   browseable = yes
   writeable = yes
   write list = pi
   create mask = 0644
   directory mask = 0755
```

## Create samba user and restart

```bash
# Set a Samba password
sudo pdbedit -a -u pi

# Restart Samba server
sudo /etc/init.d/samba restart
```

