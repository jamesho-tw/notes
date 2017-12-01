# Time Zone

Setting the timezone in Docker Container.


## Alpine Linux

```sh
apk add -U tzdata
cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime
echo "Asia/Taipei" > /etc/timezone
apk del tzdata
```


## Debian

```bash
# jessie
echo "Asia/Taipei" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
```

