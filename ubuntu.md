# Check Ubuntu version
```
$> lsb_release -a
```


# Change the hostname
```
$> sudo vi /etc/hostname
$> sudo vi /etc/hosts
$> sudo service hostname restart
```


# Oracle Java SE 8
```
$> sudo add-apt-repository -y ppa:webupd8team/java
$> sudo apt-get update
$> sudo apt-get install -y oracle-java8-installer

$> sudo rm -rf /var/cache/oracle-jdk8-installer
```

### _Check version_
```
$> java -version
$> javac -version
```


# MySQL Server
```
$> sudo apt-get install mysql-server
```

### _Check version_
```
$> mysql --version
```

### _Create a new user_
```
$> mysql -u root -p

mysql> CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL PRIVILEGES ON * . * TO 'user'@'localhost';
mysql> FLUSH PRIVILEGES;
```