#!/bin/bash

#================================================================
#   描    述：数组工具
#   Author：lee
#   Email：china2011long@163.com
#   Create Time：Sat 21 Sep 2019 04:44:55 PM CST
#
#================================================================

function array_join() {
	_paramarr=(` echo "$@"`)
	len=${#_paramarr[@]}

	_retstr=""
	for((i=0; i<$len-1;i++)){
		_retstr=${_retstr}${_paramarr[i]}"."
	}
	_retstr=${_retstr}${_paramarr[len-1]}
	echo $_retstr
}


