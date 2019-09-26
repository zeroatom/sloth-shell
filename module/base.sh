#!/bin/bash

require "log"

function die()
{
	log_warn "ERROR: $1. Aborting!"
	exit 1
}

function die_no_file()
{
	if [ ! -f $1 ];then
		log_warn "ERROR: $2. Aborting!"
		exit 1
	fi
}

function die_no_dir()
{
	if [ ! -d $1 ];then
		log_warn "ERROR: $2. Aborting!"
		exit 1
	fi
}

function die_lt()
{

	if [ $1 -lt $2 ];then
		log_warn "ERROR: $3. Aborting!"
		exit 1
	fi
}
