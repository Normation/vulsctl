#! /bin/sh -

if [ $# -eq 0 ]; then
	echo "specify [--redhat --debian]"
	exit 1
fi

target=$1
shift

case "$target" in
	--redhat) 
		gost fetch --dbtype=postgres --dbpath="postgres://vuls:${DBPASS}@127.0.0.1/gost" ${@} redhat
		;;
	--debian) 
		gost fetch --dbtype=postgres --dbpath="postgres://vuls:${DBPASS}@127.0.0.1/gost" ${@} debian
		;;
	--*)  echo "specify [--redhat --debian]"
		exit 1
	    ;;
	*) echo "specify [--redhat --debian]"
		exit 1
	    ;;
esac

exit 0

