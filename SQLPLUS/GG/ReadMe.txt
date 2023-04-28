-- Доп. установки в ROOT и контейнерной базе

SQL> alter session set container = CDB$ROOT;

Session altered.

SQL> ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;

Database altered.

SQL> ALTER SYSTEM SET ENABLE_GOLDENGATE_REPLICATION=TRUE SCOPE=BOTH;

System altered.


SQL> show pdbs

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 FXLT1                          READ WRITE NO

SQL> alter session set container = FXLT1;

Session altered.

SQL> ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;

Database altered.


From here:

https://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/goldengate/12c/OGG12c_Integrated_Replicat/index.html

-- Подключаемся к источнику и пробует оттуда забрать данные

[oracle@bksli-abs-dlsgg-test 21.3.0]$ ./ggsci

-- PDB 
GGSCI (bksli-abs-dlsgg-test.ffb.lan) 1> DBLOGIN USERID  ogguser@172.27.4.30/FXLT1 password ххх
Successfully logged into database FXLT1.

GGSCI (bksli-abs-dlsgg-test.ffb.lan as ogguser@FXLTCDB/FXLT1) 3> MININGDBLOGIN USERID ogguser@172.27.4.30/FXLT1, password ххх
Successfully logged into mining database.

-- Root
GGSCI (bksli-abs-dlsgg-test.ffb.lan) 1> DBLOGIN USERID system@172.27.4.30:1521/FXLTCDB password xxx

GGSCI (bksli-abs-dlsgg-test.ffb.lan as ogguser@FXLTCDB/FXLT1) 2> MININGDBLOGIN USERID system@172.27.4.30:1521/FXLTCDB, password

GGSCI (bksli-abs-dlsgg-test.ffb.lan as system@FXLTCDB/CDB$ROOT) 3> REGISTER EXTRACT FXLT1DWH DATABASE CONTAINER (FXLT1)

2023-03-18 00:04:42  INFO    OGG-02003  Extract group FXLT1DWH successfully registered with database at SCN 8963000830335.

