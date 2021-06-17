#!/bin/sh

for i in `seq 2002 $(date +"%Y")`; do \
    go-cve-dictionary fetchnvd -dbtype=postgres -dbpath="postgres://vuls:${DBPASS}@127.0.0.1/cvedict" $@ -years $i; \
done

for i in `seq 1998 $(date +"%Y")`; do \
    go-cve-dictionary fetchjvn -dbtype=postgres -dbpath="postgres://vuls:${DBPASS}@127.0.0.1/cvedict" $@ -years $i; \
done
