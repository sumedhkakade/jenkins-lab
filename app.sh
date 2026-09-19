#!/bin/bash

echo "Starting Jenkins Lab Application..."

while true
do
    printf 'HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n<h1>Jenkins Lab Application</h1><p>Deployed successfully through Jenkins CI/CD!</p>\r\n' | nc -l -p 8080
done
