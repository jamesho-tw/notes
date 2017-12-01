# Sonatype Nexus Repository OSS

https://www.sonatype.com/nexus-repository-oss

Documentation - http://books.sonatype.com/nexus-book/  
Download - https://www.sonatype.com/download-oss-sonatype  

## **Default credentials**
username: `admin`  
password: `admin123`  

## **Install with Docker**

* Sonatype Nexus Repository Manager 2
  https://hub.docker.com/r/sonatype/nexus/
  ```
  # for example

	sudo docker run -d -p 8081:8081 --name nexus sonatype/nexus:oss
  ```

* Nexus Repository Manager 3
  https://hub.docker.com/r/sonatype/nexus3/
  ```
  # for example

	sudo docker run -d -p 8081:8081 --name nexus sonatype/nexus3
  ```

## **As a Maven Repository**

* Nexus Repository Manager 3

  **The default repository:**

```
maven-public
maven-central
maven-snapshots
maven-releases
```

  **Configuring your Maven setting:** ( `~/.m2/settings.xml` )

```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      https://maven.apache.org/xsd/settings-1.0.0.xsd">

  <servers>
    <server>
      <id>nexus-releases</id>
      <username>user</username>
      <password>password</password>
    </server>
    <server>
      <id>nexus-snapshots</id>
      <username>user</username>
      <password>password</password>
    </server>
  </servers>

  <mirrors>
    <mirror>
      <id>central</id>
      <name>central</name>
      <url>http://localhost:8081/repository/maven-public/</url>
      <mirrorOf>*</mirrorOf>
    </mirror>
  </mirrors>

</settings>
```

  **Configuring your project:** (`pom.xml`)

```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

...

	<repositories>
		<repository>
			<id>maven-public</id>
			<url>http://localhost:8081/repository/maven-public/</url>
		</repository>
	</repositories>

...

	<scm>
		<connection>scm:git:http://localhost:8080/project/demo.git</connection>
		<url>http://localhost:8080/project/demo</url>
		<developerConnection>scm:git:http://localhost:8080/project/demo.git</developerConnection>
		<tag>HEAD</tag>
	</scm>

...

	<distributionManagement>
		<snapshotRepository>
			<id>nexus-snapshots</id>
			<url>http://localhost:8081/repository/maven-snapshots/</url>
		</snapshotRepository>
		<repository>
			<id>nexus-releases</id>
			<url>http://localhost:8081/repository/maven-releases/</url>
		</repository>
	</distributionManagement>

...

	<build>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-release-plugin</artifactId>
				<version>2.5.3</version>
				<configuration>
					<tagNameFormat>@{project.version}</tagNameFormat>
					<autoVersionSubmodules>true</autoVersionSubmodules>
					<useReleaseProfile>false</useReleaseProfile>
				</configuration>
			</plugin>
		</plugins>
	</build>

</project>
```

  **Deploy your project:**

```bash
# for example "SNAPSHOT"

$ mvn clean deploy

# for example "RELEASE"

# delete the release descriptor (release.properties)
# delete any backup POM files
$ mvn release:clean

# perform some checks
# change the version for RELEASE (remove SNAPSHOT suffix)
# run the project test
# commit and push the changes
# create the tag out of this non-SNAPSHOT versioned code
# increase the version for the next SNAPSHOT
# commit and push the changes
$ mvn release:prepare

# checkout release tag from SCM
# build and deploy released code
$ mvn release:perform

# rollback a previous release
# you haven't run release:clean on the project
$ mvn release:rollback
```
