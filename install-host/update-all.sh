#!/bin/sh

set -e

./oval.sh --redhat && \
./oval.sh --amazon && \
./oval.sh --oracle && \
./oval.sh --fedora && \
./oval.sh --suse && \
./gost.sh --redhat && \
./gost.sh --debian && \
./gost.sh --ubuntu && \
./gost.sh --microsoft && \
./cvedb.sh --nvd

# Now update production database
cp *.sqlite3 /srv/vuls/db/
# No reload
systemctl restart vuls
