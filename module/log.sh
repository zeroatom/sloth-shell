#!/bin/bash

COLOR_GREEN="\033[32m"
COLOR_WARN="\033[31m\033[01m\033[05m"
COLOR_TAIL="\033[0m"

function log_info()
{
	local datetime=`date "+%Y-%m-%d %H:%M:%S"`
	echo -e "[${datetime}] - ${COLOR_GREEN}I${COLOR_TAIL} - $1"
}

function log_warn()
{
	local datetime=`date "+%Y-%m-%d %H:%M:%S"`
	echo -e "[${datetime}] - ${COLOR_WARN}W${COLOR_TAIL} - $1"
}

cur_step=0

function log_step()
{ 
    cur_step=`expr $cur_step + 1`
	local datetime=`date "+%Y-%m-%d %H:%M:%S"`
	echo "[${datetime}] - [STEP$cur_step] - $1"
}
