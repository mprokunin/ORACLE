GGSCI (bksli-abs-dlsgg-test.ffb.lan) 3> DBLOGIN USERID system@172.27.4.30:1521/FXLTCDB password U60XwSug17335
Successfully logged into database CDB$ROOT.

GGSCI (bksli-abs-dlsgg-test.ffb.lan as system@FXLTCDB/CDB$ROOT) 5> MININGDBLOGIN USERID system@172.27.4.30:1521/FXLTCDB, password  U60XwSug17335
Successfully logged into mining database.

GGSCI (bksli-abs-dlsgg-test.ffb.lan as system@FXLTCDB/CDB$ROOT) 17> edit params ./GLOBALS
ALLOWOUTPUTDIR /u03/dirdat

GGSCI (bksli-abs-dlsgg-test.ffb.lan as system@FXLTCDB/CDB$ROOT) 7> edit params outfxlt

EXTRACT INITDWH
USERID system@172.27.4.30:1521/FXLTCDB, PASSWORD xxx
RMTHOST 172.27.4.32, MGRPORT 7809, TCPBUFSIZE 100000
RMTFILE /u03/dirdat/initload, PURGE, MAXFILES 10, MEGABYTES 1000
TABLE FXLT1.TBG.LNE_ACC_PATTERN_TYPE_C;
TABLE FXLT1.TBG.LNE_ACCOUNTS;

GGSCI (bksli-abs-dlsgg-test.ffb.lan as system@FXLTCDB/CDB$ROOT) 11> ADD EXTRACT INITDWH, SOURCEISTABLE
Extract added.

[oracle@bksli-abs-dlsgg-test 21.3.0]$ vi dirprm/loaddwh.prm
SPECIALRUN
END RUNTIME
USERID system@//10.31.209.183:1521/DWH_TST, PASSWORD U60XwSug17337
EXTFILE /u03/dirdat/initload000000
ASSUMETARGETDEFS
MAP FXLT1.TBG.LNE_ACC_PATTERN_TYPE_C, TARGET PROKUNIN_DBA.LNE_ACC_PATTERN_TYPE_C;
MAP FXLT1.TBG.LNE_ACCOUNTS, TARGET PROKUNIN_DBA.LNE_ACCOUNTS;


[oracle@bksli-abs-dlsgg-test 21.3.0]$ ./extract pf dirprm/outfxlt.prm rf dirrpt/outfxlt.rpt
[oracle@bksli-abs-dlsgg-test 21.3.0]$ ./replicat pf dirprm/loaddwh.prm rf dirrpt/loaddwh.rpt
