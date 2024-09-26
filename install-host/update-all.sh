#!/bin/sh

set -ex

export GOROOT=/usr/local/go
export GOPATH=/root/go
export PATH=/usr/local/go/bin:/root/go/bin:$PATH

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
mkdir -p /srv/vuls/db-new/
mv *.sqlite3 /srv/vuls/db-new/
systemctl stop vuls
mv /srv/vuls/db /srv/vuls/db-old
mv /srv/vuls/db-new /srv/vuls/db
# No reload
systemctl start vuls
# Clean
rm -r /srv/vuls/db-old
