#!/bin/bash

while true; do
if [ -a /var/lib/mysql/mysql.sock ]; then
    break
fi

echo "mysql.sock is not yet created"

sleep 1

done
