#!/bin/bash
# 项目 mysql table的版本化管理

. sloth-bootstrap.sh

require "log"

#mysql 配置
DB_HOST="192.168.1.251"
DB_PORT="3306"
DB_AUTH="test"
DB_PASS="123456"
DB_NAME="test"
mysql_cmd="/usr/bin/mysql"

#版本sql根目录
MT_ROOT_PATH=${RUN_PATH}/sql

# 执行sql语句
function exec_sql() {
    sql=$1
    ret=`${mysql_cmd} -h$DB_HOST -P$DB_PORT -u$DB_AUTH -p$DB_PASS $DB_NAME -e "$sql"`
    echo $ret
}

# 获取服务器版本
function get_server_mysql_update_version() {
    temp=`exec_sql "select value from sql_config where name='update_version'"`
    result=`echo $temp|awk '{print $2}'`
    echo $result
}

function cmd_rebase() { #HELP 重置数据库:\nCMD rebase 
    new_db_sql="DROP DATABASE IF EXISTS ${DB_NAME};CREATE DATABASE ${DB_NAME} DEFAULT CHARACTER SET utf8 ;"
    ${mysql_cmd} -h$DB_HOST -P$DB_PORT -u$DB_AUTH -p$DB_PASS -e "${new_db_sql}"
    rm -f *.sql
    
    file=`ls ${MT_ROOT_PATH}/release/*.sql | sort | tail -1`
    temp_sql_file=`basename ${file}`
    cp ${file} .
    if ${mysql_cmd} -h$DB_HOST -P$DB_PORT -u$DB_AUTH -p$DB_PASS $DB_NAME < ${temp_sql_file} ;then
        echo "${temp_sql_file} exec success."
        rm -f ${temp_sql_file}
    else
        echo "${temp_sql_file} exec failed."
        rm -f ${temp_sql_file}
    fi
}

function cmd_update() { #HELP 更新表:\nCMD update 
    SERVER_SQL_UPDATE_VERSION=`get_server_mysql_update_version`
    echo $SERVER_SQL_UPDATE_VERSION
    
    # 获取所有更新文件
    update_filelist=`find ${MT_ROOT_PATH}/update -name "*.sql" | sort`
    for file in $update_filelist
    do
        BASE_FILE_NAME=$(basename ${file})
        file_version=`echo $BASE_FILE_NAME| awk -F_ '{print $1}'`
        if [ $file_version -gt $SERVER_SQL_UPDATE_VERSION ]; then
            echo "sql.update start "$file 
            ${mysql_cmd} -h$DB_HOST -P$DB_PORT -u$DB_AUTH -p$DB_PASS $DB_NAME < $file 
            exec_code=$?
            update_record_sql="insert into sql_updates(name, code) values('$BASE_FILE_NAME','$exec_code')"
            exec_sql "$update_record_sql"
            echo "sql.update end "$file
            if [ $exec_code == 0 ]; then
                log_info "import $file success."
                exec_sql "update sql_config set value='$file_version' where name='update_version'"
            else
                log_info "import $file failed."
                exit 1
            fi
        fi
    done
}

require "cmd"

call_cmd "${@}"

