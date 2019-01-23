#!/bin/bash

function log_info()
{
	local datetime=`date "+%Y-%m-%d %H:%M:%S"`
	echo "[${datetime}] - $1"
}

cur_step=0

function log_step()
{ 
    cur_step=`expr $cur_step + 1`
	local datetime=`date "+%Y-%m-%d %H:%M:%S"`
	echo "[${datetime}] - [STEP$cur_step] - $1"
}
