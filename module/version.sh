#!/bin/bash

#================================================================
#   描    述： 版本号库 1.0.0.20190921_beta
#   Author：lee
#   Email：china2011long@163.com
#   Create Time：Sat 21 Sep 2019 02:24:52 PM CST
#
#================================================================
require "array"

# 大于
function version_gt() {
	test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1";
}

# 小于等于
function version_le() {
	test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" == "$1";
}

# 小于
function version_lt() {
	test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1";
}

# 大于等于
function version_ge() {
	test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1";
}

# 版本字符串解析
function version_parser() {
	_VERSION=$1
	_tarray1=(${_VERSION//_/ })
	_tarray2=(${_tarray1[0]//./ })
	_tarray3=(${_tarray1[1]//./ })

	_retarray=(${_tarray2[@]} ${_tarray3[@]})
	echo ${_retarray[*]}
}

# 数组字符串化
function version_str() {
	_paramarr=(` echo "$@"`)
	len=${#_paramarr[@]}

	_retstr=""

	len1=4
	if [ $len -lt 4 ]; then
		len1=$len
	fi

	declare -a _tarray1
	for((i=0; i<$len1;i++)){
		_tarray1[i]=${_paramarr[i]}
	}
	_retstr=${_retstr}`array_join ${_tarray1[*]}`

	if [ $len -gt 4 ];then
		declare -a _tarray2
		for((i=4; i<len;i++)){
			_tarray2[i-4]=${_paramarr[i]}
		}
		_retstr=${_retstr}"_"`array_join ${_tarray2[*]}`
	fi

	echo $_retstr
}

#获取当前版本
function obtain_txt_version() {
	if [ -f "version.txt" ]; then
		t=`cat version.txt`
		echo $t
	else
		t="1.0.0"
		echo $t > version.txt
		echo $t
	fi
}
