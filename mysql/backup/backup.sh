#!/bin/bash
USER=backup
GROUP=backup
PATH=/home/$USER/prod
DATE=$(/bin/date +%Y%m%d%H%M%S)
FILE=$PATH/oa-$DATE.sql
DBNAME=prod
/usr/bin/mysqldump --login-path=oa-prod --default-character-set=utf8 $DBNAME > $FILE
/bin/chown $USER:$GROUP $FILE
FILESIZE=$(/usr/bin/wc -c "$FILE")
if [ "$FILESIZE" = 0 ]
then
  echo $FILESIZE
  rm -rf $FILE
else
  echo "OK"
fi


## rsync - for nas backup
#rsync -avzh backup@192.168.0.1:/home/backup/prod /volume1/backup/prod