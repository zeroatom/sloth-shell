#!/bin/bash

function log_info()
{
	local datetime=`date "+%Y-%m-%d %H:%M:%S"`
	echo "[${datetime}] - $1"
}
