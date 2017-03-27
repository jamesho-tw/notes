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
*<font color=red><b>NOTE:</b> Should be able to use after re-login</font>*
