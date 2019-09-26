#!/bin/bash

#================================================================
#   描    述： lee发布工具
#   Author：lee
#   Email：china2011long@163.com
#   Create Time：Fri 20 Sep 2019 04:59:47 PM CST
#
#================================================================
. sloth-bootstrap.sh

require "log"
require "nodeenv"
require "redis"

function cmd_new() { #HELP 新建实例:\nCMD new <appid> <appinstid>
    log_info "rollback"
}

function cmd_pub() { #HELP 发布应用:\nCMD pub <xx.tar.gz>
	APP_REPO_PATH=$NODE_ENV_ROOT_PATH"/repos/dist/app"
	mv $1 $APP_REPO_PATH
}

function cmd_search() { #HELP 搜索应用:\nCMD search <name>
	APP_REPO_PATH=$NODE_ENV_ROOT_PATH"/repos/dist/app"
	echo $(find $APP_REPO_PATH -name "*$1*")
}

function cmd_install_redis() { #HELP 搜索应用:\nCMD install_redis <src_path>
	redis_install $1
}

function cmd_new_redis() { #HELP 新建redis:\nCMD new_redis <port>
	redis_new $1
}

function cmd_tip_redis() { #HELP redis提示:\nCMD tip_redis <port>
	if [ $# -lt 2 ];then
		redis_tip_get $1
	else
		_msg="${@:2}"
		redis_tip $1 "$_msg"
	fi
}

require "cmd"
call_cmd "${@}"
