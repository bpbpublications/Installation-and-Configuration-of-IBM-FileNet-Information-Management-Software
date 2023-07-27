#!/bin/bash
#
su - db2inst1
db2 CREATE DATABASE CASTORE1 AUTOMATIC STORAGE YES ON /opt/IBM/CASTORDB USING CODESET UTF-8 TERRITORY US COLLATE USING SYSTEM PAGESIZE 32768
db2 CONNECT TO CASTORE1

db2 CREATE REGULAR TABLESPACE CADATA_TS PAGESIZE 32 K MANAGED BY AUTOMATIC STORAGE EXTENTSIZE 16 OVERHEAD 10.5 PREFETCHSIZE 16 TRANSFERRATE 0.14 BUFFERPOOL IBMDEFAULTBP DROPPED TABLE RECOVERY ON

db2 CREATE USER TEMPORARY TABLESPACE USRTEMP_TS PAGESIZE 32 K MANAGED BY AUTOMATIC STORAGE EXTENTSIZE 16 OVERHEAD 10.5 PREFETCHSIZE 16 TRANSFERRATE 0.14 BUFFERPOOL IBMDEFAULTBP
db2 GRANT CREATETAB, CONNECT ON DATABASE TO USER causer
db2 GRANT USE OF TABLESPACE CADATA_TS TO USER causer
db2 GRANT USE OF TABLESPACE USRTEMP_TS TO USER causer
db2 UPDATE DATABASE CONFIGURATION USING APPLHEAPSZ 2560 IMMEDIATE
db2 GRANT SELECT on SYSIBM.SYSVERSIONS TO causer
db2 GRANT SELECT on SYSCAT.DATATYPES TO causer
db2 GRANT SELECT on SYSCAT.INDEXES TO causer
db2 GRANT SELECT on SYSIBM.SYSDUMMY1 TO causer
db2 GRANT USAGE on workload SYSDEFAULTUSERWORKLOAD TO causer
db2 GRANT IMPLICIT_SCHEMA on DATABASE TO causer
db2 CONNECT RESET
