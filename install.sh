#!/bin/bash

INSTALL_PATH=$HOME/bin/sloth-shell

rm -rf $INSTALL_PATH

mkdir -p $INSTALL_PATH

cp -r ./module $INSTALL_PATH/
cp -r ./sloth-bootstrap.sh $HOME/bin/
