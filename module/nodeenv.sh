#!/bin/bash

#================================================================
#   描    述： 节点 环境
#   Author：lee
#   Email：china2011long@163.com
#   Create Time：Mon 23 Sep 2019 10:11:10 AM CST
#
#================================================================

NODE_ENV_ROOT_PATH=$HOME/ne
NODE_ENV_DIR=(
	"root_app" 
	"root_app2"
	"root_app3"

	"global_app"
	"tmp"
	"repos/backups"
	"repos/dist/app"
	"repos/docs"

	"etc"
)

# 基础软件路径
NODE_BASE_APP_PATH="$NODE_ENV_ROOT_PATH/base_app"

# 全局软件路径
NODE_GLOBAL_APP_PATH="$NODE_ENV_ROOT_PATH/global_app"

# 运行标志目录
NODE_RUN_PATH="$NODE_ENV_ROOT_PATH/run"
