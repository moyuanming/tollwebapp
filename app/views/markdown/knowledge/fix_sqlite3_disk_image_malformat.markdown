Sqlite3修复数据库

有的时候sqlite3数据库会损坏，使用的时候提示：sqlite3 disk image malformat，这个时候，如何恢复数据呢？

登录到车道  ssh 或者telnet  进入 /EMRCV4/DATA/ 命令行 sqlite3 



再执行命令行命令，将你的数据库中的数据导出为sql语句文件

    sqlite3 EMRC_MSG_DB
    sqlite>.output tmp.sql
    sqlite>.dump
    sqlite>.quit





最后导入到一个新库中

    sqlite3 EMRC_MSG_DB_NEW
    sqlite>.read tmp.sql
    sqlite>.quit

    mv EMRC_MSG_DB  EMRC_MSG_DB_OLD
    mv EMRC_MSG_DB_NEW  EMRC_MSG_DB
    
 

