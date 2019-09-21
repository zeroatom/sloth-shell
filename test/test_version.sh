#!/bin/bash

. sloth-bootstrap.sh

require "debug"
require "log"
require "version"

function test_plan(){
	VERSION1=$1
	VERSION2=$2
	if version_gt $VERSION1 $VERSION2; then
		log_step "$VERSION1 gt $VERSION2"
	else
		log_step "$VERSION1 not gt $VERSION2"
	fi
	
	if version_le $VERSION1 $VERSION2; then
		log_step "$VERSION1 le $VERSION2"
	else
		log_step "$VERSION1 not le $VERSION2"
	fi

	if version_lt $VERSION1 $VERSION2; then
		log_step "$VERSION1 lt $VERSION2"
	else
		log_step "$VERSION1 not lt $VERSION2"
	fi

	if version_ge $VERSION1 $VERSION2; then
		log_step "$VERSION1 ge $VERSION2"
	else
		log_step "$VERSION1 not ge $VERSION2"
	fi
}

test_plan "1.0.0" "1.0.2"

test_plan "1.0.0" "1.1.0"

test_plan "1.0.0" "2.0.0"

test_plan "1.0.0" "1.0.0"

function version_parser1() {
    _VERSION=$1
    _tarray1=(${_VERSION//_/ })
    _tarray2=(${_tarray1[0]//./ })
    _tarray3=(${_tarray1[1]//./ })

    _retarray=(${_tarray2[@]} ${_tarray3[@]})
    echo ${_retarray[*]}                                                                                           
}

v_array=($(version_parser "1.2.3.20190921_beta.1.3"))

echo "${v_array[*]}"

version_str ${v_array[*]}

v_array2=($(version_parser "1.2.3"))

echo "${v_array2[*]}"

version_str ${v_array2[*]}
