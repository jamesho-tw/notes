# Change the time zone
```
$> sudo raspi-config
```
select the `4` `Localisation Option`,  
navigate to and select `I2` `Change Timezone`,  
select `Asia` and choose `Ok`,  
select `Taipei` and choose `Ok`.


# Setting the time using NTP
```
$> sudo apt-get install ntpdate
$> sudo ntpdate -u tw.pool.ntp.org
```
_Public NTP Pool Time Servers -_ [http://support.ntp.org/bin/view/Servers/NTPPoolServers](http://support.ntp.org/bin/view/Servers/NTPPoolServers)


# The Traditional Chinese input method
```
$> sudo raspi-config
```
select the `4` `Localisation Option`,  
navigate to and select `I1` `Change Locale`,  
select `zh_TW.UTF-8 UTF-8` and choose `Ok`,  
set the default locale for the system environment `zh_TW.UTF-8` and choose `Ok`

```
$> sudo apt-get install scim-chewing
```
> _**NOTE:** Should be able to use after re-login_


# As a WiFi hotspot
```
$> sudo apt-get update
$> sudo apt-get upgrade
$> sudo apt-get install dnsmasq hostapd
```

### _Configure the `dhcpcd`_
```
$> sudo vi /etc/dhcpcd.conf

denyinterfaces wlan0
```
> _**NOTE:** Add the following line to the bottom of the file_

### _Configure the `wlan0` interface with a static IP_
```
$> sudo vi /etc/network/interfaces

allow-hotplug wlan0  
iface wlan0 inet static  
    address 10.1.1.254
    netmask 255.255.255.0
    network 10.1.1.0
    broadcast 10.1.1.255
    dns-nameservers 8.8.8.8
#    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```

### _Configure the `hostapd`_
```
$> sudo vi /etc/hostapd/hostapd.conf

# This is the name of the WiFi interface we configured above
interface=wlan0

# Use the nl80211 driver with the brcmfmac driver
driver=nl80211

# This is the name of the network
ssid=Pi3-AP

# Use the 2.4GHz band
hw_mode=g

# Use channel 6
channel=6

# Enable 802.11n
ieee80211n=1

# Enable WMM
wmm_enabled=1

# Enable 40MHz channels with 20ns guard interval
ht_capab=[HT40][SHORT-GI-20][DSSS_CCK-40]

# Accept all MAC addresses
macaddr_acl=0

# Use WPA authentication
auth_algs=1

# Require clients to know the network name
ignore_broadcast_ssid=0

# Use WPA2
wpa=2

# Use a pre-shared key
wpa_key_mgmt=WPA-PSK

# The network passphrase
wpa_passphrase=password

# Use AES, instead of TKIP
rsn_pairwise=CCMP
```

> _**NOTE:** Create a new configuration file, you can change the AP name and passowrd_

### _Set the `hostapd` starts up on boot_
```
$> sudo vi /etc/default/hostapd

DAEMON_CONF="/etc/hostapd/hostapd.conf"
```

### _Configure the `dnsmasq`_
```
$> sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
$> sudo vi /etc/dnsmasq.conf

interface=wlan0
server=8.8.8.8
dhcp-range=10.1.1.50,10.1.1.150,12h
```

> _**NOTE:** Keep the original file and creating a new one_

### _Set the `IPv4` forwarding_
```
$> sudo vi /etc/sysctl.conf

net.ipv4.ip_forward=1
```

> _**NOTE:** Remove the `#`_  
> Activate it immediately with: `$> sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"`

### _Configure the `NAT`_
```
$> sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
$> sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
$> sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

$> sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
```

### _Load the `NAT` rules on boot_
```
$> sudo vi /etc/rc.local

iptables-restore < /etc/iptables.ipv4.nat
```

> _**NOTE:** Just above the line `exit 0`_

### _Finally_
```
$> sudo service hostapd start
$> sudo service dnsmasq start
$> sudo reboot
```
