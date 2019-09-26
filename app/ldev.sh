#!/bin/bash

#================================================================
#   描    述： lee开发工具
#   Author：lee
#   Email：china2011long@163.com
#   Create Time：Fri 20 Sep 2019 04:59:47 PM CST
#
#================================================================
. sloth-bootstrap.sh

require "base"
require "log"
require "tip"

# 获取分支名
function obtain_git_branch {
	br=`git branch | grep "*"`
	echo ${br/* /}
}

function cmd_tip() { #HELP 记录提示:\nCMD tip
    _tip_file_path="$RUN_PATH/TIP"
	if [ $# -lt 1 ];then
		tip_get $_tip_file_path
	else
		_msg="${@:1}"
		tip_add $_tip_file_path "$_msg"
	fi

}

function cmd_start() { #HELP 开始特性:\nCMD start <name>
    FEATURE_NAME=$1
	CUR_BRANCH_NAME=`obtain_git_branch`
	git checkout -b $FEATURE_NAME $CUR_BRANCH_NAME
}

function cmd_start_remote() { #HELP 开始远程特性:\nCMD start_remote <name>
    FEATURE_NAME=$1
	CUR_BRANCH_NAME=`obtain_git_branch`
	git checkout -b $FEATURE_NAME $CUR_BRANCH_NAME
	git push origin $FEATURE_NAME:$FEATURE_NAME
}

function cmd_merge() { #HELP 合并特性:\nCMD merge <name>
    FEATURE_NAME=$1
    git merge --no-ff $FEATURE_NAME
}

function cmd_list() { #HELP 显示所有特性:\nCMD list
	git branch  -a
}

function cmd_del() { #HELP 删除特性:\nCMD del  <name>
    FEATURE_NAME=$1
	log_info "$FEATURE_NAME"
	git branch -d $FEATURE_NAME
}

function cmd_commit() { #HELP 提交:\nCMD commit
    CUR_BRANCH_NAME=`obtain_git_branch`
    REMOTE_BRANCH_NAME=`git branch -a|grep "remotes/origin/$CUR_BRANCH_NAME"`
	if [ -n "$REMOTE_BRANCH_NAME" ]; then
		log_info "pull $CUR_BRANCH_NAME"
		git pull origin $CUR_BRANCH_NAME
	fi
	git status
	log_info "change-feature-bug-release-tag"
	log_info "git commit -m "
}

require "cmd"
call_cmd "${@}"
