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
require "version"

#获取当前版本
function obtain_cur_version() {
	if [ -f "version.txt" ]; then
		t=`cat version.txt`
		echo $t
	else
		t="1.0.0"
		echo $t > version.txt
		echo $t
	fi
}

function cmd_major() { #HELP 主版本:\nCMD major
	CUR_VERSION=`obtain_cur_version`
	log_info "当前版本: $CUR_VERSION"
	ver_array=($(version_parser $CUR_VERSION))
	ver_array[0]=$[${ver_array[0]}+1]
	new_ver_str=$(version_str ${ver_array[*]})
	log_info "新版本: $new_ver_str"
	echo $new_ver_str > version.txt
}

function cmd_minor() { #HELP 次版本:\nCMD minor
	CUR_VERSION=`obtain_cur_version`
	log_info "当前版本: $CUR_VERSION"
	ver_array=($(version_parser $CUR_VERSION))
	ver_array[1]=$[${ver_array[1]}+1]
	new_ver_str=$(version_str ${ver_array[*]})
	log_info "新版本: $new_ver_str"
	echo $new_ver_str > version.txt
}

function cmd_patch() { #HELP 修订版本:\nCMD patch
	CUR_VERSION=`obtain_cur_version`
	log_info "当前版本: $CUR_VERSION"
	ver_array=($(version_parser $CUR_VERSION))
	ver_array[2]=$[${ver_array[2]}+1]
	new_ver_str=$(version_str ${ver_array[*]})
	log_info "新版本: $new_ver_str"
	echo $new_ver_str > version.txt
}

function cmd_show() { #HELP 显示版本:\nCMD show
	CUR_VERSION=`obtain_cur_version`
	log_info "当前版本: $CUR_VERSION"
}


require "cmd"
call_cmd "${@}"
