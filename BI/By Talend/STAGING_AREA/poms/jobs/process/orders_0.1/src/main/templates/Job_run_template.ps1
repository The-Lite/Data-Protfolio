$fileDir = Split-Path -Parent $MyInvocation.MyCommand.Path
cd $fileDir
java '-Dtalend.component.manager.m2.repository=%cd%/../lib' '-Xms256M' '-Xmx1024M' '-Dfile.encoding=UTF-8' -cp '.;../lib/routines.jar;../lib/log4j-jcl-2.12.1.jar;../lib/log4j-slf4j-impl-2.12.1.jar;../lib/log4j-api-2.12.1.jar;../lib/log4j-core-2.12.1.jar;../lib/bcprov-jdk15on-1.60.jar;../lib/commons-lang-2.6.jar;../lib/commons-logging-1.1.3.jar;../lib/jtds-1.3.1-patch-20190523.jar;../lib/hsqldb.jar;../lib/ucanaccess-2.0.9.5.jar;../lib/jackcess-encrypt-2.1.4.jar;../lib/slf4j-api-1.7.25.jar;../lib/dom4j-2.1.1.jar;../lib/jackcess-2.1.12.jar;../lib/talend_DB_mssqlUtil-1.4.jar;../lib/crypto-utils.jar;../lib/talend-ucanaccess-utils-1.0.0.jar;orders_0_1.jar;' staging_area.orders_0_1.Orders  $args