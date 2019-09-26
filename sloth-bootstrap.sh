#!/bin/bash

if [ ${SLOTH_BASE} ]; then
	return 0
fi
SLOTH_BASE="SLOTH_BASE"

#  初始化全局的环境变量
SCRIPT_NAME=$(basename $0)
SCRIPT_PATH="$(cd -P "$(dirname "$SOURCE" )" && pwd )"
RUN_DAY=$(date +%Y%m%d)
SOURCE="$0"
while [ -h "$SOURCE" ];do
	SCRIPT_PATH="$(cd -P "$(dirname "$SOURCE" )" && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$SCRIPT_PATH/$SOURCE"
done
SCRIPT_PATH="$(cd -P "$(dirname "$SOURCE" )" && pwd )"
RUN_PATH=`pwd`
GLOBAL_CONFIG_PATH=$HOME/.sloth
SLOTH_TPL_PATH=$HOME/bin/sloth-shell/tpl

# 添加模块path
MODULE_PATH=$HOME/bin/sloth-shell/module
export PATH=$PATH:${MODULE_PATH}

# 模块载入方法
PackageDict=()

function require()
{
	for i in ${PackageDict[@]} 
	do
		if [ "$i" == "$1" ]; then
      		#echo "required "$1
			return 0
		fi
	done
    #echo "require "$1
	PackageDict=("${PackageDict[@]}" "$1")
	. $1".sh"
}
