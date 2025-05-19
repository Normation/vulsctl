#!/bin/sh

set -e

export GOROOT=/usr/local/go
export GOPATH=/root/go
export PATH=/usr/local/go/bin:/root/go/bin:$PATH


./oval.sh --redhat && \
./oval.sh --amazon && \
./oval.sh --debian && \
./oval.sh --ubuntu && \
./oval.sh --alpine && \
./oval.sh --oracle && \
./oval.sh --fedora && \
./oval.sh --suse && \
./gost.sh --redhat && \
./gost.sh --debian && \
./gost.sh --ubuntu && \
./gost.sh --microsoft && \
./cvedb.sh --nvd
#./cvedb.sh --jvn && \
#./cvedb.sh --fortinet && \
#./cvedb.sh --mitre && \
#./exploitdb.sh && \
#./msfdb.sh && \
#./kev.sh && \
#./cti.sh

# Now update production database
cp *.sqlite3 /srv/vuls/db/
# No reload
systemctl restart vuls
