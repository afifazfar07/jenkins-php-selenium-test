#!/usr/bin/env sh

set -x
docker run -d -p 80:80 --name my-apache-php-app --network jenkins -v "C:/Users/afifa/Desktop/SIT Modules/ICT3203/Labs/jenkins-php-selenium-test:/var/www/html" php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'