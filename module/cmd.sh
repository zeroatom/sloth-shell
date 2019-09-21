#!/bin/bash

require "log"
require "safe"

function cmd_help() {
    sed -n "s/^.*#HELP\\s//p;" < "$1" | sed "s/\\\\n/\n\t/g;s/$/\n/;s!CMD!${1/!/\\!}!g"
    echo "显示帮助信息:"
    echo "      $1 help"
}

cmdDict=()
function init_cmdDict() {
    if [ ${#cmdDict[*]} == 0 ]; then
        #sed -n "s/^.*#HELP\\s//p;" < "$1" | awk '{print $2}'
        cmdDict=`(sed -n "s/^.*#HELP\\s//p;" < "$1" | awk '{print $2}')`
    fi
}

init_cmdDict $0

# 调命令
function call_cmd() {
    [[ -z "${1-}" ]]
    case $1 in
        *) 
    	for i in ${cmdDict[@]} 
    	do
    		if [ "$i" == "$1" ]; then
                cmd_"$1" "${@:2}" 
    			exit 0
    		fi
    	done
        cmd_help "$0"
        ;;
    esac
}

# 调安全指令
function safe_call_cmd() {
    [[ -z "${1-}" ]]
    case $1 in
        *) 
    	for i in ${cmdDict[@]} 
    	do
    		if [ "$i" == "$1" ]; then
				guard_begin
                cmd_"$1" "${@:2}" 
				guard_end
    			exit 0
    		fi
    	done
        cmd_help "$0"
        ;;
    esac
}
