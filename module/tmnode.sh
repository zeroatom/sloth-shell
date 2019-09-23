#!/bin/bash

#================================================================
#   描    述： tm 节点
#   Author：lee
#   Email：china2011long@163.com
#   Create Time：Mon 23 Sep 2019 10:11:10 AM CST
#
#================================================================

function get_tm_node(){
    NODE_NAME=$1
	egrep -v "^$|^#" /data/common/server_list/games_list | awk '{print $2,$4,$5}' |grep $NODE_NAME | head -1
}

function get_all_tm_node(){
    NODE_NAME=$1
	egrep -v "^$|^#" /data/common/server_list/games_list | awk '{print $2,$4,$5}' | sort
}
