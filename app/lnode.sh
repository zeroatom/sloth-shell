#!/bin/bash

#================================================================
#   描    述： lee节点工具
#   Author：lee
#   Email：china2011long@163.com
#   Create Time：Fri 20 Sep 2019 04:59:47 PM CST
#
#================================================================
. sloth-bootstrap.sh

require "log"
require "tmnode"
require "nodeenv"

function cmd_init_env() { #HELP 初始化节点环境:\nCMD init_env
	log_info "node env root path:${NODE_ENV_ROOT_PATH}"
	len=${#NODE_ENV_DIR[@]}
	for((i=0; i<$len;i++)){
		_tmp_abs_path=$NODE_ENV_ROOT_PATH"/"${NODE_ENV_DIR[i]}
		if [ ! -d $_tmp_abs_path ];then
			log_info "new dir $_tmp_abs_path"
			mkdir -p $_tmp_abs_path
		fi
	}
	log_info "node env init finished."
}

function cmd_tree_env() { #HELP 树环境信息:\nCMD tree_env
	tree ${NODE_ENV_ROOT_PATH}
}

function cmd_info() { #HELP 节点信息:\nCMD info
	get_all_tm_node
}

function cmd_node() { #HELP 进入节点:\nCMD node
    _node_name=$1
    _node_info=($(get_tm_node $_node_name))
	len=${#_node_info[@]}
	if [ $len -eq 3 ];then
		ssh ${_node_info[1]}
	else
		log_info "no node $_node_name"
		exit 1
	fi
}

require "cmd"
call_cmd "${@}"
