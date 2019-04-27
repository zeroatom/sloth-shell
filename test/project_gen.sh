#!/bin/bash
# 项目生成器
. sloth-bootstrap.sh

require "log"

# @param path 目标路径
# @param tpl_file 模板名
# 
function gen_file_f()
{
	gen_target_path="$GEN_P_ROOT_PATH/"$1
	gen_tpl_path="$GEN_PTPL_ROOT_PATH/"$2

	mkdir -p `dirname $gen_target_path`
	cp $gen_tpl_path $gen_target_path

	if [ $# -eq 3 ];then
		sed -i $3 $gen_target_path
	fi
}

function gen_dir()
{
	gen_target_path="$GEN_P_ROOT_PATH/"$1
	mkdir -p $gen_target_path
}

function cmd_create_project() { #HELP 创建项目:\nCMD create_project <name>
	GEN_PROJECT_NAME=$1
	GEN_P_ROOT_PATH=`pwd`"/$GEN_PROJECT_NAME"
	GEN_PTPL_ROOT_PATH=`pwd`"/TPL"
	log_info "项目目录: $GEN_P_ROOT_PATH"
	mkdir -p $GEN_P_ROOT_PATH

	# 生成脚本起始位置
	gen_file_f "package.json" "package.json" "s/-PROJECT_NAME-/$GEN_PROJECT_NAME/g;s/-VERSION-/1.0.0/g"
	gen_dir "test"
	gen_file_f "app/test.json" "app/test.json"
}

require "cmd"

call_cmd "${@}"

