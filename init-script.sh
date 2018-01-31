#!/bin/bash

# Setting SSH server

echo "root:hammer" | chpasswd
cp sshd_config /etc/ssh/
service ssh restart

# Enable Python syntax completion 
cp .pythonrc ~/.pythonrc
cp .bashrc ~/.bashrc

# Postgres init

echo "Trying to wait postgres"
until psql -h "engine_db" -p 5432 -U "postgres" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
>&2 echo "Postgres is up..."

psql -h "engine_db" -U "postgres" -p 5432 -a -q -f database/tables.sql

python aggregator/engine.py

