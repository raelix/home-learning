#!/bin/bash

# Setup System
echo "root:hammer" | chpasswd
cp system-config/sshd_config /etc/ssh/
cp system-config/.pythonrc ~/.pythonrc
cp system-config/.bashrc ~/.bashrc
service ssh restart

# Postgres init
echo "Trying to wait postgres"
until psql -h "db" -p 5432 -U "postgres" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
>&2 echo "Postgres is up..."

psql -h "db" -U "postgres" -p 5432 -a -q -f database/tables.sql

python home_learning/engine.py

