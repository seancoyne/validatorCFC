#!/bin/bash
WGET_OPTS="-nv"
if [ "$TRAVIS" == "true" ]; then
	WORKDIR="$HOME/work"
	RAILO_URL=http://getrailo.com/railo/remote/download42/4.2.0.000/railix/linux/railo-express-4.2.0.000-nojre.tar.gz
	MXUNIT_URL="https://github.com/marcins/mxunit/archive/fix-railo-nulls.zip"
else
	# not TravisCI - local OSX testing
	WORKDIR=/tmp/work
	RAILO_URL="http://getrailo.com/railo/remote/download42/4.2.0.000/railix/linux/railo-express-4.2.0.000-nojre.tar.gz"
	MXUNIT_URL="https://github.com/marcins/mxunit/archive/fix-railo-nulls.zip"
	TRAVIS_BUILD_DIR=`pwd`
fi

echo "Working directory: $WORKDIR"

if [ ! "$1" == "install" ]; then
	if [ ! -d $WORKDIR ]; then
		echo "Working directory doesn't exist and this isn't an install!"
		exit 1
	else
		cd $WORKDIR
	fi
fi

case $1 in
	install)
		if [ -d $WORKDIR ]; then
			rm -rf $WORKDIR
		fi

		mkdir -p $WORKDIR
		cd $WORKDIR

		# Download Railo Express
		if [[ "$RAILO_URL" == *zip ]]; then
			wget $WGET_OPTS $RAILO_URL -O railo.zip
			unzip -q railo.zip
		else
			wget $WGET_OPTS $RAILO_URL -O railo.tar.gz
			tar -zxf railo.tar.gz
		fi
		mv railo-express* railo
		wget $WGET_OPTS $MXUNIT_URL -O mxunit.zip
		unzip -q mxunit.zip -d railo/webapps/www/
		mv railo/webapps/www/mxunit* railo/webapps/www/mxunit
		ln -s $TRAVIS_BUILD_DIR railo/webapps/www/validatorCFC
		;;
	start)
		if [ ! -f railo/start ]; then
			echo "Railo start script does not exist!"
			exit 1
		fi
		echo "Starting Railo..."
		sh railo/start>/dev/null &
		until curl -s http://localhost:8888>/dev/null
		do
			echo "Waiting for Railo..."
			sleep 1
		done
		;;
	stop)
		echo "Stopping Railo..."
		sh railo/stop
		while curl -s http://localhost:8888>/dev/null
		do
			echo "Waiting for Railo..."
			sleep 1
		done
		;;
	*)
		echo "Usage: $0 {install|start|stop}"
		exit 1
		;;
esac

exit 0