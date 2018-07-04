#!/bin/bash


sudo /etc/init.d/mysql stop
if [ $? -eq 0 ]; then
	echo "mysql successfully stopped"
else
	echo "Failed to stop mysql. Exit status=$?" >> ~/StopError.log
fi

sudo /etc/init.d/nginx stop
if [ $? -eq 0 ]; then
	echo "nginx successfully stopped"
else
	echo "Failed to stop nginx. Exit status=$?" >> ~/StopError.log
fi


sudo /data/eko/tomcat/bin/catalina.sh stop
if [ $? -eq 0 ]; then
	echo "tomcat stopped successfully"
else
	echo "Failed to stop tomcat. Exit status=$?" >> ~/StopError.log
fi

sudo /data/eko/jboss-4.2.3.GA/bin/shutdown.sh -S
if [ $? -eq 0 ]; then
	echo "jboss stopped successfully"
else
	echo "Failed to stop jboss. Exit status=$?" >> ~/StopError.log

fi


