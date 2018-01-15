#!/usr/bin/env bash

function sync_dir()
{
	local DIR=$1
	local paths=$(cat .repo/manifest.xml | grep "path=\"${DIR}" | sed -E 's/.*path="([^"]*)".*/\1/')
	for loop in $paths
	do
		echo "syncing $loop"
		repo sync -c $loop
	done
}

while [ $# -gt 0 ]; do
	sync_dir $1
	shift
done
