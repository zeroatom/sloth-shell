#!/bin/bash

. sloth-bootstrap.sh

require "log"

#1 创建备份目录
backupdir="./backup1/"
if [ ! -d $backupdir ];then
    mkdir -p $backupdir
fi

today=`date +%Y-%m-%d_%H_%M_%S`
fpath=$backupdir$today

log_info "backup fpath:$fpath"
if [ ! -d $fpath ];then
    mkdir $fpath
fi

#2 删除旧备份文件
find $backupdir -type f -mtime +1 -print -exec /bin/rm -f {} \;

#3 根据文件列表拷贝文件
fl=`cat ./backupfile_list`
for i in $fl ; do
    cp -Rp $i $fpath
done
#4 拷贝最后一个文件
cp -Rp $0 $fpath
cp -Rp ./backupfile_list $fpath

#5 打包
cd $backupdir
tar zcf $today.tar.gz $today
rm -rf $today
cd -

#6 上传
log_info "upload $today.tar.gz ..."
