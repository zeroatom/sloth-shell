#!/bin/bash

#================================================================
#   描    述：提示
#   Author：lee
#   Email：china2011long@163.com
#   Create Time：Mon 23 Sep 2019 03:22:30 PM CST
#
#================================================================
require "log"

function tip_add() {
	log_info "TIP to $1"
    echo $2 >> $1
}

function tip_get() {
    cat $1
}
