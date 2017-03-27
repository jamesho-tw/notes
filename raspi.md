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
