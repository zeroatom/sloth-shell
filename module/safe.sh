#!/bin/bash

require "log"

#脚本锁文件
SCRIPT_LOCK_FILE="/tmp/${SCRIPT_NAME}.lock"

#添加锁文件
function lock()
{
	log_info "${SCRIPT_NAME} lock"
	touch ${SCRIPT_LOCK_FILE}
}

function unlock()
{
	log_info "${SCRIPT_NAME} unlock"
	rm -f ${SCRIPT_LOCK_FILE}
}

function guard_begin()
{
	if [ -f "$SCRIPT_LOCK_FILE" ]; then
		log_info "${SCRIPT_NAME} is running"
		echo "${SCRIPT_NAME} is running" && exit 1
	fi
	lock
}

guard_end()
{
	unlock
}
