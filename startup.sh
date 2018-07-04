#!/bin/bash

sudo /etc/init.d/mysql start
if [ $? -eq 0 ]; then
	echo "mysql successfully started"
else
	echo "Failed to start mysql Exit status=$?" >> ~/StartError.log
fi

sudo /etc/init.d/nginx start
if [ $? -eq 0 ]; then
	echo "nginx successfully started" 
else
	echo "Failed to start nginx. Exit status=$?" >> ~/StartError.log
fi


sudo /data/eko/tomcat/bin/catalina.sh start
if [ $? -eq 0 ]; then
	echo "tomcat started successfully"
else
	echo "Failed to start tomcat. Exit status=$?" >> ~/StartError.log
fi

sudo /data/eko/jboss-4.2.3.GA/bin/run.sh -b 0.0.0.0 &
if [ $? -eq 0 ]; then
	echo "jboss started successfully"
else
	echo "Failed to start jboss. Exit status=$?" >> ~/StartError.log
fi

