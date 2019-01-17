#!/bin/bash
. sloth-bootstrap.sh

function cmd_listtpl() { #HELP 打印所有模板:\nCMD listtpl <a1>
    tplpath=~/bin/sloth-shell/tpl/
    ls -R $tplpath
}

function cmd_usetpl() { #HELP 使用模板:\nCMD usetpl <a1>
    tplpath=~/bin/sloth-shell/tpl/$1
    cp $tplpath $RUN_PATH
}

require "cmd"

call_cmd "${@}"

