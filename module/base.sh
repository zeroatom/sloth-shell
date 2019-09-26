#!/bin/bash

require "log"

function die()
{
	log_warn "ERROR: $1. Aborting!"
	exit 1
}
