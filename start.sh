#!/bin/bash

# 启动Nginx
nginx -g "daemon off;" &

# 启动PHP-FPM
php7.4-fpm -F
