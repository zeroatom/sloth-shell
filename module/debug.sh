#!/bin/bash
require "log"
require "nodeenv"

function debug_sloth()
{
	log_info "SCRIPT_NAME="$SCRIPT_NAME
	log_info "SCRIPT_PATH="$SCRIPT_PATH
	log_info "RUN_PATH="$RUN_PATH

	log_info "节点环境根目录="$NODE_ENV_ROOT_PATH
	log_info "节点基础软件目录="$NODE_BASE_APP_PATH
	log_info "节点全局软件目录="$NODE_GLOBAL_APP_PATH
	log_info "节点运行标志目录="$NODE_RUN_PATH
}
