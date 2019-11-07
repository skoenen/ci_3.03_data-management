#!/bin/sh

export PGADMIN_SETUP_EMAIL='db@hsrw.local'
export PGADMIN_SETUP_PASSWORD=secret

python /usr/lib/pgadmin4/web/setup.py
