### mysql_config_editor



Displays a help message

```
mysql_config_editor set --help
```



To set up the login paths in the `.mylogin.cnf` file

```
mysql_config_editor set --login-path=mypath --host=127.0.0.1 --port=3306 --user=root --password
```



To see what [**mysql_config_editor**](https://dev.mysql.com/doc/refman/8.0/en/mysql-config-editor.html) writes to the `.mylogin.cnf` file

```
mysql_config_editor print --all
```



To removes the entire `mypath` login path

```
mysql_config_editor remove --login-path=mypath
```

