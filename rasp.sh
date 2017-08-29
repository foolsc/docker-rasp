#!/bin/bash
/etc/init.d/mysql restart

sleep 1

mysql -u root -pdcsec.rasp -e "source /lib/sql-initialize.sql;"

sleep 1

/usr/jvm/jdk1.8.0_144/bin/java -server -Xms512m -Xmx512m -Dfile.encoding=utf-8 -Djava.io.tmpdir=/tmp -jar /usr/local/work/rasp-app.jar --spring.profiles.active=prod
