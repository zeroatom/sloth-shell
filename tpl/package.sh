#!/bin/bash
# 打包脚本

. sloth-bootstrap.sh

require "log"

# 打包工程目录
P_PROJECT_PATH=${RUN_PATH}/pj
# 打包路径
P_BUILD_PATH=${RUN_PATH}/pj/build
# 工程名称
P_PROJECT_NAME="test"

echo ${P_PROJECT_NAME}

# 1 进入工程目录
log_info "PROJECT_PATH=$P_PROJECT_PATH"
cd $P_PROJECT_PATH

# 2 清除编译相关数据
log_info "***********************************************"
log_step "clean project start..."
log_info "***********************************************"


log_info "***********************************************"
log_step "clean build_path..."
log_info "***********************************************"
if [ -d ${P_BUILD_PATH} ];then
    rm -rf ${P_BUILD_PATH}
    log_info "clean build_path success."
fi

# 3 编译工程

# 4 创建打包目录
mkdir -p ${P_BUILD_PATH}

# 5 拷贝包需要的所有文件

# 6 打包
build_version="1.0.0"
dist_name="${P_PROJECT_NAME}_${build_version}_${RUN_DAY}"
echo ${dist_name}

log_info "***********************************************"
log_info "package ended"
log_info "***********************************************"
