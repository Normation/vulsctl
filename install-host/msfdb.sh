#!/bin/bash

go-msfdb fetch --dbtype=postgres --dbpath="postgres://vuls:${DBPASS}@127.0.0.1/cvedict" msfdb
