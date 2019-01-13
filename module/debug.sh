#!/bin/bash
require "log"

function debug_sloth()
{
	log_info "SCRIPT_NAME="$SCRIPT_NAME
	log_info "SCRIPT_PATH="$SCRIPT_PATH
	log_info "RUN_PATH="$RUN_PATH
}
