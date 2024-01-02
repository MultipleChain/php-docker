#!/bin/bash

# Composer install komutu
cd /var/www/html
cd evm-chains && composer install --ignore-platform-reqs
cd ../bitcoin && composer install --ignore-platform-reqs
cd ../solana && composer install --ignore-platform-reqs
cd ../tron && composer install --ignore-platform-reqs
cd ../utils && composer install --ignore-platform-reqs

# Apache veya PHP sunucusunu başlat
apache2-foreground
