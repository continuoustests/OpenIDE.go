#!/bin/bash

ROOT=$(cd $(dirname "$0"); pwd)
DEPLOYDIR=$(cd $(dirname "$0"); pwd)/bin

if [ -d $DEPLOYDIR ]; then
{
    rm -r $DEPLOYDIR/
}
fi

mkdir $DEPLOYDIR

mkdir $DEPLOYDIR/go-files
mkdir $DEPLOYDIR/go-files/rscripts
mkdir $DEPLOYDIR/go-files/graphics

cd $ROOT/src/go
go build
cd $ROOT
mv $ROOT/src/go/go $ROOT/bin

# Package
cp $ROOT/package.json $DEPLOYDIR/go-files/package.json
cp $ROOT/rscripts/go-build.sh $DEPLOYDIR/go-files/rscripts/go-build.sh
cp $ROOT/graphics/* $DEPLOYDIR/go-files/graphics/

# Building packages
echo "Building packages.."
oi package build bin/go $DEPLOYDIR
