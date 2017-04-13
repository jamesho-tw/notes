# WildFly

[http://wildfly.org/](http://wildfly.org/)

Documentation  
[https://docs.jboss.org/author/display/WFLY10/Documentation](https://docs.jboss.org/author/display/WFLY10/Documentation)


## Install MySQL driver

### _Download the MySQL Connector/J_
[https://dev.mysql.com/downloads/connector/j/](https://dev.mysql.com/downloads/connector/j/https://dev.mysql.com/downloads/connector/j/)

```
$> cd $WILDFLY_HOME
$> cd modules/system/layers/base/com
$> mkdir -p mysql/driver/main

$> cp mysql-connector-java-x.x.xx-bin.jar $WILDFLY_HOME/modules/system/layers/base/com/mysql/driver/main/
$> cd $WILDFLY_HOME/modules/system/layers/base/com/mysql/driver/main
$> touch module.xml

$> vi module.xml

<?xml version="1.0" encoding="UTF-8"?>
<module xmlns="urn:jboss:module:1.3" name="com.mysql.driver">
    <resources>
        <resource-root path="mysql-connector-java-x.x.xx-bin.jar"/>
    </resources>
    <dependencies>
        <module name="javax.api"/>
        <module name="javax.transaction.api"/>
    </dependencies>
</module>
```

### _Add the MySQL driver definition_

> _**for example:**_ `standalone` mode.

```
$> cd $WILDFLY_HOME/standalone/configuration/
$> vi standalone.xml

<drivers>
    <driver name="h2" module="com.h2database.h2">
        <xa-datasource-class>org.h2.jdbcx.JdbcDataSource</xa-datasource-class>
    </driver>
    <driver name="mysql" module="com.mysql.driver"/>
</drivers>
```

> _**NOTE:** Add `<driver name="mysql" module="com.mysql.driver"/>` inside the `<subsystem xmlns="urn:jboss:domain:datasources:4.0">` -> `<datasources>` -> `<drivers>`_

## Startup

`standalone` mode
```
$> cd $WILDFLY_HOME\bin
$> ./standalone.sh
```

`domain` mode
```
$> cd $WILDFLY_HOME\bin
$> ./domain.sh
```

## Shutdown
```
$> cd $WILDFLY_HOME\bin
$> ./jboss-cli.sh --connect controller=127.0.0.1:9990 command=:shutdown
```
