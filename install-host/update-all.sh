#!/bin/sh

./oval.sh --redhat && \
./oval.sh --amazon && \
./oval.sh --debian && \
./oval.sh --ubuntu && \
./oval.sh --alpine && \
./oval.sh --sles   && \
./gost.sh --redhat && \
./gost.sh --debian && \
./cvedb.sh && \
./exploitdb.sh && \
./msfdb.sh
