#!/bin/bash

INSTALL_PATH=$HOME/bin/sloth-shell

rm -rf $INSTALL_PATH

mkdir -p $INSTALL_PATH

APP_PATH=$HOME/bin/sloth-app

rm -rf $APP_PATH
mkdir -p $APP_PATH

cp -r ./module $INSTALL_PATH/
cp -r ./tpl  $INSTALL_PATH/
cp -r ./sloth-bootstrap.sh $HOME/bin/
cp -r ./sloth.sh $HOME/bin/
cp -r ./lualib $INSTALL_PATH/
cp -r ./app/*sh $APP_PATH
