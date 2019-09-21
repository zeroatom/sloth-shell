#!/bin/bash
. sloth-bootstrap.sh

function cmd_test() { #HELP 重启服务器:\nCMD test <a1>
    echo "lee"
}

function cmd_test1() { #HELP 重启服务器:\nCMD test1 <a1>
    echo "lee1"
}

require "cmd"

safe_call_cmd "${@}"

