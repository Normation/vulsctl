#! /bin/sh -

if [ $# -eq 0 ]; then
	echo "specify [--redhat --amazon --debian --ubuntu --alpine --sles]"
	exit 1
fi

target=$1
shift

case "$target" in
	--redhat) 
		goval-dictionary fetch-redhat -dbtype=postgres -dbpath="postgres://vuls:${DBPASS}@127.0.0.1/cvedict" ${@} 6 7 8 
		;;
	--amazon) 
		goval-dictionary fetch-amazon -dbtype=postgres -dbpath="postgres://vuls:${DBPASS}@127.0.0.1/cvedict" ${@} 
		;;
	--debian) 
		goval-dictionary fetch-debian -dbtype=postgres -dbpath="postgres://vuls:${DBPASS}@127.0.0.1/cvedict" ${@} 8 9 10
		;;
	--ubuntu) 
		goval-dictionary fetch-ubuntu -dbtype=postgres -dbpath="postgres://vuls:${DBPASS}@127.0.0.1/cvedict" ${@} 14 16 18 20
		;;
	--sles)
		goval-dictionary fetch-suse -dbtype=postgres -dbpath="postgres://vuls:${DBPASS}@127.0.0.1/cvedict" -suse-enterprise-server ${@} 11 12 15
		;;
	--alpine) 
		goval-dictionary fetch-alpine -dbtype=postgres -dbpath="postgres://vuls:${DBPASS}@127.0.0.1/cvedict" ${@} 3.3 3.4 3.5 3.6 3.7 3.8 3.9 3.10
		;;
	--*)  echo "specify [--redhat --amazon --debian --ubuntu --alpine]"
		exit 1
		;;
	*) echo "specify [--redhat --amazon --debian --ubuntu --alpine]"
		exit 1
		;;
esac

exit 0

