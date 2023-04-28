--На стороне АБС--
--На стороне АБС--
WITH t0 AS (
SELECT
	col.table_name,
    col.column_name,
	col.data_type, 
	CASE WHEN col.data_type IN ('TIMESTAMP(6)' , 'DATE') THEN '' ELSE to_char(col.data_length) END data_length,
		CASE WHEN col.column_name IN
	(
	'PATTERN_TYPE_C', 'PATTERN_TYPE_C', 'BAL_TYPE_C', 'CODE', 'ADD_ID', 'COMM_ID', 'AGR_NO', 
	'STATUS_C', 'SUB_CODE', 'CTRL_ID', 'BORROWER_TYPE_C', 'KIND_AGR_C', 'PARTY_C', 'NO', 
	'COLLATERAL_KIND_C', 'CODE_C', 'INS_ID', 'ITEMS_CODE_ID', 'ITEMS_CODE_C', 'PROP_CODE_C', 
	'VID_COM_C', 'CM_CODE', 'CTYPE_C', 'COND_ID', 'ID_CODE_C', 'LIMIT_TYPE_C', 'NDS_FLAG_C', 'OPER_NO', 
	'OPER_ID', 'CODE_OPER_C', 'CODE_303_C', 'GROUP_CODE_C', 'PLNG_ID', 'RATE_ID', 'RATE_SCHEME_ID', 'RECIPIENT_TYPE_C', 
	'RESERV_TYPE_C', 'SCHED_ID', 'START_DATE', 'HIST_ID', 'PER_FLAG_C', 'RETURN_TYPE_C'
	)
	THEN ' PRIMARY KEY' ELSE '' END ppk
FROM ALL_TAB_COLUMNS col
	WHERE col.table_name IN (SELECT table_name FROM ALL_TABLES WHERE owner = 'TBG')
	AND col.table_name IN 
	(
'LNE_ACCOUNTS', 'LNE_ACC_PATTERN_TYPE_C', 'LNE_ACCT_BAL_TYPE_C', 'LNE_ACCT_TYPE', 'LNE_ADD_AGR', 'LNE_AGR_COMISS', 
'LNE_AGREEMENTS', 'LNE_AGR_PURPOSE', 'LNE_AGR_STATUS_C', 'LNE_AGR_SUB_TYPE', 'LNE_AGR_TYPE', 'LNE_BALCTRL', 'LNE_BORROWER_TYPE_C', 
'LNE_COLLAT_AGR_KIND_C', 'LNE_COLLAT_AGR_PARTY_C', 'LNE_COLLATERAL', 'LNE_COLLATERAL_ITEM', 'LNE_COLLATERAL_KIND_C', 'LNE_COLLATERAL_TYPE', 
'LNE_COLLAT_INS_KIND_C', 'LNE_COLLAT_INSURANCE', 'LNE_COLLAT_ITEM_PROPS_C', 'LNE_COLLAT_ITEMS_C', 'LNE_COLLAT_PROPS_C', 'LNE_COMISS_KIND_C', 
'LNE_COMISS_SCH', 'LNE_COMISS_TYPE_C', 'LNE_CONDITION_C', 'LNE_CONDITIONS', 'LNE_DEBT_REASONS', 'LNE_GROUP_RISK', 'LNE_ID_CODE_C', 
'LNE_ID_CODE_VALUES_C', 'LNE_INSURANCE_KIND_C', 'LNE_LIMIT_TYPE_C', 'LNE_NDS_FLAG_C', 'LNE_OPERATION', 'LNE_OPERATION_CHARGED', 
'LNE_OPERATION_TYPE_C', 'LNE_PMT_AMOUNT_TYPE_C', 'LNE_PORTF_CODE_303_C', 'LNE_PORTFOLIO_GROUP_C', 'LNE_PROLONG', 'LNE_PURPOSES_OF_CREDIT', 
'LNE_RATE', 'LNE_RATE_SCHEME', 'LNE_RATE_SCHEME_HDR', 'LNE_RECIPIENT_TYPE_C', 'LNE_REP_DATE_TYPE_C', 'LNE_RESERV_SCN_SETUP', 
'LNE_RESERV_TYPE_C', 'LNE_SCHEDULE', 'LNE_SCHEDULE_HDR', 'LNE_SCHEDULE_HIST', 'LNE_SCHEDULE_PER_FLAG_C', 'LNE_SCHEDULE_RET_TYPE_C', 
'LNE_SCHEDULE_SCHEME', 'LNE_SHIFT_HOLIDAY_C'
	)
),
t1 AS (
SELECT
	table_name,
	REPLACE(
	column_name||' '||data_type||'('||data_length||')'||ppk , '()' , '') field 
FROM t0
	),
t2 AS (
SELECT DISTINCT table_name,
listagg(field, ', ')  WITHIN GROUP (order by field) OVER (partition by table_name) as fields
FROM t1)
SELECT DISTINCT 'CREATE TABLE TBG.'||table_name||' ('|| fields ||' );' FINAL_DDL FROM t2
;--На стороне DWH--
CREATE TABLE TBG.LNE_PORTFOLIO_GROUP_C (CONS_COLL_FLAG VARCHAR2(4), DESCRIPTION VARCHAR2(1024), GROUP_CODE_C VARCHAR2(120) PRIMARY KEY, NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_OPERATION_TYPE_C (ACC_TYPE VARCHAR2(120), ADD_GROUP VARCHAR2(120), CAN_UPDATE VARCHAR2(4), CHECK_AUTH_FLAG VARCHAR2(4), CODE_OPER_C VARCHAR2(400) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), GROUP_OPER_C VARCHAR2(120), NAME VARCHAR2(1024), REVERS_CODE_OPER_C VARCHAR2(400) );
CREATE TABLE TBG.LNE_AGR_TYPE (BASE VARCHAR2(120), BRANCH VARCHAR2(32), CODE VARCHAR2(120) PRIMARY KEY, DESCR VARCHAR2(960), LIMIT VARCHAR2(120), LOAN VARCHAR2(120), MODULE VARCHAR2(120), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_COMISS_KIND_C (DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024), VID_COM_C VARCHAR2(120) PRIMARY KEY );
CREATE TABLE TBG.LNE_ID_CODE_C (ACTUAL VARCHAR2(4), DESCRIPTION VARCHAR2(1024), ID_CODE_C VARCHAR2(120) PRIMARY KEY, NAME VARCHAR2(1024) );


CREATE TABLE TBG.LNE_COLLAT_ITEMS_C (DESCRIPTION VARCHAR2(1020), HYPOTHEC_COND VARCHAR2(4), ITEMS_CODE_C VARCHAR2(120) PRIMARY KEY, ITEMS_GROUP_C VARCHAR2(120), ITEMS_SUB_GROUP_C VARCHAR2(120), MODIFIED TIMESTAMP(6), MODIFIED_BY VARCHAR2(160), NAME VARCHAR2(1020), NOTIFICATION_NOTARY_C VARCHAR2(120), PLEDGE_COND VARCHAR2(4) );
CREATE TABLE TBG.LNE_COMISS_TYPE_C (CTYPE_C VARCHAR2(40) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_GROUP_RISK (ACC_DOH VARCHAR2(100), ACC_DOH_DISCONT VARCHAR2(100), ACC_DOH_GOS VARCHAR2(100), ACC_DOH_GRNT VARCHAR2(100), ACC_DOH_INT VARCHAR2(100), ACC_DOH_INT_OV VARCHAR2(100), ACC_DOH_KOM VARCHAR2(100), ACC_DOH_LIM_GRNT VARCHAR2(100), ACC_DOH_OV_INT_OV VARCHAR2(100), ACC_DOH_PR_KOM VARCHAR2(100), ACC_DOH_PROCH_KOM VARCHAR2(100), ACC_DOH_PROCH_O_KOM VARCHAR2(100), ACC_DOH_PR_PR VARCHAR2(100), ACC_DOH_PR_PROCH_KOM VARCHAR2(100), ACC_DOH_PR_PROCH_O_KOM VARCHAR2(100), ACC_DOH_PR_SSUDA VARCHAR2(100), ACC_DOH_SHTRAF VARCHAR2(100), ACC_DOH_SHTRAF_OD VARCHAR2(100), ACC_DOH_SHTRAF_PR VARCHAR2(100), ACC_DOH_USL VARCHAR2(80), ACC_RASH VARCHAR2(100), ACC_RASH_DISCONT VARCHAR2(100), ACC_RASH_GOS VARCHAR2(100), ACC_RASH_GRNT VARCHAR2(100), ACC_RASH_INT VARCHAR2(100), ACC_RASH_INT_OV VARCHAR2(100), ACC_RASH_KOM VARCHAR2(100), ACC_RASH_LIM_GRNT VARCHAR2(100), ACC_RASH_OV_INT_OV VARCHAR2(100), ACC_RASH_PR_KOM VARCHAR2(100), ACC_RASH_PROCH_KOM VARCHAR2(100), ACC_RASH_PROCH_O_KOM VARCHAR2(100), ACC_RASH_PR_PR VARCHAR2(100), ACC_RASH_PR_PROCH_KOM VARCHAR2(100), ACC_RASH_PR_PROCH_O_KOM VARCHAR2(100), ACC_RASH_PR_SSUDA VARCHAR2(100), ACC_RASH_SHTRAF VARCHAR2(100), ACC_RASH_SHTRAF_OD VARCHAR2(100), ACC_RASH_SHTRAF_PR VARCHAR2(100), ACC_RASH_USL VARCHAR2(80), BALANS_FLAG VARCHAR2(4), BRANCH VARCHAR2(32), CODE NUMBER(22) PRIMARY KEY, DESCR VARCHAR2(960), MODULE VARCHAR2(80), RESERV NUMBER(22), RESERV_DO NUMBER(22), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_AGR_PURPOSE (AGR_NO NUMBER(22) PRIMARY KEY, BRANCH VARCHAR2(32), CREATED TIMESTAMP(6), CREATED_BY VARCHAR2(120), ID NUMBER(22), MAIN_PURPOSE VARCHAR2(4), PURPOSE_CODE VARCHAR2(120), REMARKS VARCHAR2(960), SUM NUMBER(22), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_AGREEMENTS (AGR_ID VARCHAR2(100), AGR_NO NUMBER(22) PRIMARY KEY, AGR_SUB_TYPE VARCHAR2(120), AGR_TYPE VARCHAR2(120), AGR_UID VARCHAR2(152), BRANCH VARCHAR2(32), CARD_CONDITION VARCHAR2(4), CHANNEL_C VARCHAR2(120), CLOSED DATE, CREATED TIMESTAMP(6), CREATED_BY VARCHAR2(120), CURRENCY_NO VARCHAR2(12), CUST_CLASS VARCHAR2(4), CUSTOMER_NAME VARCHAR2(960), CUSTOMER_NO NUMBER(22), DIVISION VARCHAR2(32), END_DATE DATE, I_DOC_NO NUMBER(22), I_INT_VAL_DATE DATE, I_TR_NO NUMBER(22), I_VAL_DATE DATE, KIND VARCHAR2(120), MAIN_AGR NUMBER(22), MODULE VARCHAR2(120), NEXT_REP_DATE DATE, OLD_AGR VARCHAR2(120), OLD_SYS VARCHAR2(120), PENS_FLAG VARCHAR2(4), PROD_CLASS_C VARCHAR2(120), PROGRESS_FLAG VARCHAR2(4), REMARKS VARCHAR2(960), SIGNED DATE, STATUS_C VARCHAR2(120), SUBDIVISION VARCHAR2(32), UPDATED DATE, UPDATED_BY VARCHAR2(160) );
CREATE TABLE TBG.LNE_CONDITION_C (CODE_C VARCHAR2(120) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024), RES_COND_FLAG VARCHAR2(4) );
CREATE TABLE TBG.LNE_OPERATION (AGR_NO NUMBER(22) PRIMARY KEY, AMOUNT NUMBER(22), AMOUNT_CUR NUMBER(22), AUXILIARY_FLG VARCHAR2(12), BRANCH VARCHAR2(32), CM_CODE VARCHAR2(120), COLLATERAL_NO NUMBER(22), COLL_ITEM_NO NUMBER(22), COM_FLAG VARCHAR2(4), CREATED TIMESTAMP(6), CREATED_BY VARCHAR2(120), CURRENCY_NO VARCHAR2(12), CURRENCY_NO_2 VARCHAR2(12), DATE_OP DATE, DOC_NO NUMBER(22), DOC_NO_COM NUMBER(22), DOC_NO_FIX NUMBER(22), DOC_NO_TMP VARCHAR2(40), EARLY_FLAG VARCHAR2(4), FVIRTUAL VARCHAR2(4), GREIS_FLAG VARCHAR2(4), GR_TYPE_OP_C VARCHAR2(120), IFRS_FLAG VARCHAR2(40), IFRS_OPER_NO NUMBER(22), IFRS_TAB VARCHAR2(200), INT_DATE DATE, LOG_ID NUMBER(22), MIN_PAY_FLAG VARCHAR2(4), NDS_AMOUNT NUMBER(22), NDS_AMOUNT_CUR NUMBER(22), OBJECT_KEY NUMBER(22), OPER VARCHAR2(120), OPER_NO NUMBER(22), OVERDUE_FLAG VARCHAR2(4), PARENT_OPER_NO NUMBER(22), PAYMENT_PURPOSE VARCHAR2(960), PR_KOM_DATE DATE, SCT_CODE VARCHAR2(120), SENDING_TO_NOTARY VARCHAR2(4), STATUS VARCHAR2(32), ST_DATE DATE, STINT_DATE DATE, TR_NO NUMBER(22), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120), VIRTUAL_PAY VARCHAR2(12) );
CREATE TABLE TBG.LNE_BALCTRL (ACCT_TYPE VARCHAR2(120), ACTIV_SPHERE VARCHAR2(12), AGR_KIND VARCHAR2(120), BEG_PERIOD NUMBER(22), BRANCH VARCHAR2(32), CTRL_ID NUMBER(22) PRIMARY KEY, CUST_CLASS_C VARCHAR2(120), END_PERIOD NUMBER(22), KPA_CODE VARCHAR2(100), LEDGER VARCHAR2(20), LEDGER_CUR VARCHAR2(20), MODULE VARCHAR2(120), PROD_CLASS_C VARCHAR2(120), PROP_CTGRY_CBRF VARCHAR2(120), SUBLEDGER VARCHAR2(20), SUBLEDGER_CUR VARCHAR2(20), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_COLLAT_ITEM_PROPS_C (DATA_TYPE VARCHAR2(120), DEFAULT_VALUE VARCHAR2(1024), ITEMS_CODE_C VARCHAR2(120) PRIMARY KEY, ITEMS_CODE_ID NUMBER(22), MODIFIED TIMESTAMP(6), MODIFIED_BY VARCHAR2(160), ORDER_ID NUMBER(22), PROP_CODE_C VARCHAR2(120) );
CREATE TABLE TBG.LNE_RATE (ACC_CODE VARCHAR2(120), ADD_ATTR_ID NUMBER(22), AGR_NO NUMBER(22) PRIMARY KEY, BRANCH VARCHAR2(32), CREATED TIMESTAMP(6), CREATED_BY VARCHAR2(160), FIX_PERIOD_N NUMBER(22), FIX_PERIOD_UNIT VARCHAR2(120), GR_CODE VARCHAR2(120), GREIS_GR_CODE VARCHAR2(80), GREIS_PERIOD NUMBER(22), GREIS_TYPE VARCHAR2(80), GR_TYPE_OP_C VARCHAR2(120), MODULE VARCHAR2(80), RATE_ID NUMBER(22), START_DATE DATE , UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120), USE_TYPE_C VARCHAR2(120) );
CREATE TABLE TBG.LNE_LIMIT_TYPE_C (DESCRIPTION VARCHAR2(1024), LIMIT_TYPE_C VARCHAR2(40) PRIMARY KEY, NAME VARCHAR2(200) );
CREATE TABLE TBG.LNE_PMT_AMOUNT_TYPE_C (CODE_C VARCHAR2(120) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_RATE_SCHEME (FIX_PERIOD_N NUMBER(22), FIX_PERIOD_UNIT VARCHAR2(120), GR_CODE VARCHAR2(120), GREIS_GR_CODE VARCHAR2(120), GR_TYPE_OP_C VARCHAR2(120), RATE_ID NUMBER(22) PRIMARY KEY, RATE_SCHEME_ID NUMBER(22), START_PERIOD NUMBER(22), START_RATE NUMBER(22), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120), USE_TYPE_C VARCHAR2(120) );
CREATE TABLE TBG.LNE_ACCOUNTS (ACC_CODE VARCHAR2(120), ACC_ID VARCHAR2(100), ACCT_ID NUMBER(22), AGR_FLAG VARCHAR2(4), AGR_NO NUMBER(22) PRIMARY KEY, BRANCH VARCHAR2(32), CREATED TIMESTAMP(6), CREATED_BY VARCHAR2(120), ID NUMBER(22), MODULE VARCHAR2(120), OPER_NO NUMBER(22), PATTERN VARCHAR2(120), PATTERN_TYPE VARCHAR2(4), START_DATE DATE, UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_ADD_AGR (ADD_ID NUMBER(22) PRIMARY KEY, AGR_NO NUMBER(22), BRANCH VARCHAR2(32), COMMENTS VARCHAR2(1020), DESCR VARCHAR2(960), NO VARCHAR2(120) , NO_DATE DATE, OPER_DATE DATE, UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_RESERV_SCN_SETUP (CLASS_OP VARCHAR2(200), PORTFOLIO_FLAG VARCHAR2(4), RESERV_TYPE_C VARCHAR2(120) PRIMARY KEY, SIGN VARCHAR2(120) );
CREATE TABLE TBG.LNE_COLLAT_INSURANCE (AGR_NO_STRACH VARCHAR2(120), BRANCH VARCHAR2(32), CREATED TIMESTAMP(6), CREATED_BY VARCHAR2(120), CUSTOMER_NO NUMBER(22), DATE_FACT DATE, END_DATE DATE, INS_ID NUMBER(22) PRIMARY KEY, KIND_STRACH VARCHAR2(40), NAME_CYR VARCHAR2(960), NO NUMBER(22), POLIS_NO VARCHAR2(120), POLIS_SERIA VARCHAR2(120), REMARK VARCHAR2(1020), REMITENT VARCHAR2(120), SIGNED DATE, START_DATE DATE, STRACH_PREMIUM NUMBER(22), STRACH_SUM NUMBER(22), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_OPERATION_CHARGED (AGR_NO NUMBER(22) PRIMARY KEY, BRANCH VARCHAR2(32), CHARGE_OPER_NO NUMBER(22), CM_CODE VARCHAR2(120), DATE_OP DATE, DESCR VARCHAR2(1020), DOC_NO NUMBER(22), FINAL_FLAG VARCHAR2(12), NDS_AMOUNT NUMBER(22), OPER VARCHAR2(104), OPER_ID NUMBER(22) , OPER_NO NUMBER(22), PAY_OPER_NO NUMBER(22), SPIS_FLG VARCHAR2(12), SPIS_VALUE_DATE DATE, SUM_SPIS NUMBER(22), UPDATED DATE, UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_SCHEDULE_RET_TYPE_C (DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024), RETURN_TYPE_C VARCHAR2(120) PRIMARY KEY );
CREATE TABLE TBG.LNE_AGR_COMISS (ACC_AMORT_COM VARCHAR2(100), ACC_COM VARCHAR2(100), ACC_DOH_COM VARCHAR2(100), ACC_NACH_COM VARCHAR2(100), AGR_NO NUMBER(22), AMORTIZATION_FLG VARCHAR2(4), ATTRIBUTE VARCHAR2(120), BRANCH VARCHAR2(32), CALC_BALANCE_TYPE VARCHAR2(120), CM_CODE VARCHAR2(120) , COMM_ID NUMBER(22) PRIMARY KEY, COM_PERIOD VARCHAR2(120), CPAY_AMOUNT NUMBER(22), CTYPE VARCHAR2(120), EPS_FLG VARCHAR2(4), FIX_SUM VARCHAR2(200), FRACTION_COUNT VARCHAR2(4), FRE_SUM NUMBER(22), HOLIDAY_C VARCHAR2(120), INCL_IN_SCHED VARCHAR2(4), INCLUSION_TYPE_C VARCHAR2(120), MAX_AMOUNT NUMBER(22), MIN_AMOUNT NUMBER(22), MODULE VARCHAR2(80), NACH_TYPE VARCHAR2(4), NDS NUMBER(22), PARTIAL_FLAG VARCHAR2(4), PERIOD_DAY NUMBER(22), PERIOD_WD VARCHAR2(12), PMT_CODE_C VARCHAR2(120), PP VARCHAR2(4), ROUNDING_METHOD VARCHAR2(120), SHIFT_CALC_COND VARCHAR2(120), SHIFT_CALC_PERIOD_N NUMBER(22), SHIFT_CALC_PERIOD_UNIT VARCHAR2(120), START_DATE DATE, SUBSTANTIONAL_FLG VARCHAR2(4), SUM_TYPE VARCHAR2(120), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120), USE_ACCR_SETTING_COND VARCHAR2(4), USE_TYPE_C VARCHAR2(120), VID_COM VARCHAR2(80) );
CREATE TABLE TBG.LNE_SCHEDULE_PER_FLAG_C (DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024), PER_FLAG_C VARCHAR2(4) PRIMARY KEY );
CREATE TABLE TBG.LNE_COLLAT_AGR_PARTY_C (DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024), PARTY_C VARCHAR2(120) PRIMARY KEY );
CREATE TABLE TBG.LNE_RESERV_TYPE_C (ACC_CODE VARCHAR2(120), DESCRIPTION VARCHAR2(1024), DISTRIB_OBESP VARCHAR2(4), NAME VARCHAR2(1024), OPER_TYPE VARCHAR2(120), PORTF_RESERV VARCHAR2(4), RES_CODE VARCHAR2(120), RESERV_TYPE_C VARCHAR2(120) PRIMARY KEY, USE_OBESP VARCHAR2(4) );
CREATE TABLE TBG.LNE_SCHEDULE_SCHEME (BRANCH VARCHAR2(32), CALENDAR_CODE VARCHAR2(240), CODE VARCHAR2(120) PRIMARY KEY, CRF_HOL VARCHAR2(4), DAY_NDL VARCHAR2(4), DESCR VARCHAR2(960), DOUBLE_GRAPH VARCHAR2(4), FM_HOL VARCHAR2(4), FRACTION_COUNT VARCHAR2(4), GROUP_SIGN VARCHAR2(40), HOLIDAY_ALLOW VARCHAR2(4), INCLUDE_COM_ANUITET VARCHAR2(4), INT_CALC_DATE NUMBER(22), INT_CALC_DISCARD VARCHAR2(4), INT_CALC_PERIOD_TYPE VARCHAR2(120), INT_PAY_END_MONTH VARCHAR2(4), INT_PAY_PERIOD VARCHAR2(120), INT_PAY_PERIOD_AMOUNT NUMBER(22), INT_PERIOD VARCHAR2(120), INT_PERIOD_AMOUNT NUMBER(22), INT_PERIOD_SETTINGS VARCHAR2(4), INT_SEPARATE_PERCENT VARCHAR2(4), INT_SHIFT_PERIOD VARCHAR2(120), INT_SHIFT_PERIOD_AMOUNT NUMBER(22), LAST_PAY_DISCARD VARCHAR2(4), LOAN_CALC_DATE NUMBER(22), LOAN_CALC_PERIOD_TYPE VARCHAR2(120), LOAN_INDIVIDUAL_CALC VARCHAR2(4), LOAN_MANUAL_PAY VARCHAR2(4), LOAN_PAY_COUNT NUMBER(22), LOAN_PAY_END_MONTH VARCHAR2(4), LOAN_PAY_PERIOD VARCHAR2(120), LOAN_PAY_PERIOD_AMOUNT NUMBER(22), LOAN_PERIOD VARCHAR2(120), LOAN_PERIOD_AMOUNT NUMBER(22), LOAN_SHIFT_PERIOD VARCHAR2(120), LOAN_SHIFT_PERIOD_AMOUNT NUMBER(22), MONTH_PAYMENT NUMBER(22), NO NUMBER(22), PRC_CALC_MODE VARCHAR2(120), PRC_SEPARATE_PRC_N NUMBER(22), RETURN_TYPE VARCHAR2(120), ROUNDING_METHOD VARCHAR2(120), ROUND_INT_FLAG VARCHAR2(4), ROUND_LOAN_FLAG VARCHAR2(4), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_SCHEDULE_HDR (ACT_PAY_FLAG VARCHAR2(4), AGR_NO NUMBER(22), BRANCH VARCHAR2(32), DOSR_DATE DATE, EDIT_COND VARCHAR2(4), EDIT_PSK VARCHAR2(4), EFFECT_RATE NUMBER(22), EFFECT_RATE_2 NUMBER(22), EP NUMBER(22), EXT_FLAG VARCHAR2(4), GR_CODE VARCHAR2(120), HDR_ID NUMBER(22), INDIV_PSK VARCHAR2(4), LAST_PMT_DATE DATE, LOST_INCOME VARCHAR2(4), MIDDLE_PAYMENT NUMBER(22), PARENT_DATE DATE, PRC_CALC_DATE DATE, PRC_CALC_MODE VARCHAR2(120), PSK NUMBER(22), REMAINDER NUMBER(22), RESTRUCT_FLAG VARCHAR2(4), SCHED_TYPE VARCHAR2(120), SCHEDULE_TYPE_C VARCHAR2(120), START_DATE DATE, UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_COLLAT_PROPS_C (DATA_TYPE VARCHAR2(120), DESCRIPTION VARCHAR2(1024), MODIFIED TIMESTAMP(6), MODIFIED_BY VARCHAR2(160), NAME VARCHAR2(400), NUM_ORDER NUMBER(22), PROP_CODE_C VARCHAR2(120) PRIMARY KEY, SYSTEM_FLAG VARCHAR2(4) );
CREATE TABLE TBG.LNE_RATE_SCHEME_HDR (ACC_CODE VARCHAR2(120), BRANCH VARCHAR2(32), DIVISION VARCHAR2(32), GREIS_PERIOD NUMBER(22), GREIS_TYPE VARCHAR2(640), MODIFIED TIMESTAMP(6), MODIFIED_BY VARCHAR2(120), RATE_SCHEME_ID NUMBER(22) PRIMARY KEY, SCHEME_ID NUMBER(22), START_DATE DATE );
CREATE TABLE TBG.LNE_ACCT_TYPE (ACC_DEL VARCHAR2(4), AGR_FLAG VARCHAR2(4), AVG_PAY_FLAG VARCHAR2(4), BASE VARCHAR2(120), CALC_BASE VARCHAR2(120), CALC_INT VARCHAR2(120), CODE VARCHAR2(120) PRIMARY KEY, COPY_CODE VARCHAR2(120), DESCR VARCHAR2(960), INT VARCHAR2(120), MODULE VARCHAR2(120), OPEN_FLAG VARCHAR2(4), PR_COM_CODE VARCHAR2(120), RES_FLAG VARCHAR2(4), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_AGR_SUB_TYPE (BRANCH VARCHAR2(32), CODE VARCHAR2(120) PRIMARY KEY, DESCR VARCHAR2(960), MODULE VARCHAR2(120), SUB_CODE VARCHAR2(120), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_ID_CODE_VALUES_C (DESCRIPTION VARCHAR2(1024), ID_CODE_C VARCHAR2(120) PRIMARY KEY, ID_CODE_VALUE_C VARCHAR2(1024) );
CREATE TABLE TBG.LNE_SHIFT_HOLIDAY_C (CODE_C VARCHAR2(120) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_AGR_STATUS_C (DESCRIPTION VARCHAR2(1024), FOR_BCH_ACC_MAP VARCHAR2(4), NAME VARCHAR2(1024), STATUS_C VARCHAR2(120) PRIMARY KEY );
CREATE TABLE TBG.LNE_COLLATERAL_KIND_C (COLLATERAL_KIND_C VARCHAR2(120) PRIMARY KEY, DESCRIPTION VARCHAR2(2048), NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_REP_DATE_TYPE_C (CODE_C VARCHAR2(120) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_SCHEDULE (AGR_NO NUMBER(22), BASE NUMBER(22), BASE_BILL_FLAG VARCHAR2(4), BRANCH VARCHAR2(32), CALC_DATE DATE, CALC_INT_DATE DATE, COM NUMBER(22), COM_BILL_FLAG VARCHAR2(4), INT NUMBER(22), INT_BILL_FLAG VARCHAR2(4), ISSUE_OPER_NO NUMBER(22), OPER_NO NUMBER(22), PAY_BASE_AMT NUMBER(22), PAY_COM_AMT NUMBER(22), PAY_DATE DATE, PAY_INT_AMT NUMBER(22), PAY_THIRD_AMT NUMBER(22), PER_FLAG VARCHAR2(4), PROC_DATE DATE, REMAINDER NUMBER(22), SCHED_ID NUMBER(22), SCH_ROW_TYPE VARCHAR2(4), START_DATE DATE, STATUS_C VARCHAR2(4), THIRD NUMBER(22), THIRD_BILL_FLAG VARCHAR2(4), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_PROLONG (ADD_PERCENT VARCHAR2(4), AGR_NO NUMBER(22), BANK_CLERK_NO NUMBER(22), BRANCH VARCHAR2(32), FIRM_BASE VARCHAR2(960), FIRM_CLERK VARCHAR2(960), FIRM_CLERK_NAME VARCHAR2(960), FIRM_FACE VARCHAR2(960), GROUP_RISK NUMBER(22), LIMIT NUMBER(22), LIMIT_DATE DATE, LIMIT_DAY_NUM NUMBER(22), LIMIT_TYPE VARCHAR2(4), PAY_DAY NUMBER(22), PAY_MONTH NUMBER(22), PAY_PERIOD VARCHAR2(80), PLAN_DAY_NUM NUMBER(22), PLAN_END_DATE DATE, PLNG_DATE DATE, PLNG_ID NUMBER(22) PRIMARY KEY, PORTOFOLIO VARCHAR2(48), PREV_DAY_NUM NUMBER(22), PREV_END_DATE DATE, RESERV NUMBER(22), SIGN_DATE DATE, START_DATE DATE, STORAGE_AMOUNT NUMBER(22), STORAGE_PERIOD VARCHAR2(128), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_ACCT_BAL_TYPE_C (BAL_TYPE_C VARCHAR2(120) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_ACC_PATTERN_TYPE_C (ACCT_OPEN_FLAG VARCHAR2(4), DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024), PATTERN_TYPE_C VARCHAR2(4) PRIMARY KEY );
CREATE TABLE TBG.LNE_CONDITIONS (AGR_NO NUMBER(22), BRANCH VARCHAR2(32), CODE VARCHAR2(120), COND_ID NUMBER(22) PRIMARY KEY, DESCR VARCHAR2(960), OPER_NO NUMBER(22), START_DATE DATE, UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120), VALUE VARCHAR2(960) );
CREATE TABLE TBG.LNE_COLLATERAL_ITEM (AGR_NO NUMBER(22), BRANCH VARCHAR2(32), COLLATERAL_NO NUMBER(22), COST NUMBER(22), CREATED TIMESTAMP(6), CREATED_BY VARCHAR2(120), DESCR VARCHAR2(960), DESCRIPTION VARCHAR2(1020), END_DATE DATE, ITEM_TYPE VARCHAR2(120), NO NUMBER(22), START_DATE DATE, UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_COLLAT_INS_KIND_C (CODE_C VARCHAR2(40) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), INS_CODE_303_C VARCHAR2(120), NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_NDS_FLAG_C (DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(200), NDS_FLAG_C NUMBER(22) PRIMARY KEY );
CREATE TABLE TBG.LNE_COLLATERAL_TYPE (ACC_NAME VARCHAR2(100), BALANS VARCHAR2(120), BRANCH VARCHAR2(32), CODE VARCHAR2(120) PRIMARY KEY, COEFF NUMBER(22), CREATED TIMESTAMP(6), CREATED_BY VARCHAR2(120), DESCR VARCHAR2(960), GR_ACT VARCHAR2(20), KIND VARCHAR2(120), PATTERN_TYPE VARCHAR2(120), SYSTEM_TYPE VARCHAR2(4), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120) );
CREATE TABLE TBG.LNE_INSURANCE_KIND_C (CODE_C VARCHAR2(128) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), INS_CODE_303_C VARCHAR2(120), NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_RECIPIENT_TYPE_C (DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024), RECIPIENT_TYPE_C VARCHAR2(120) PRIMARY KEY );
CREATE TABLE TBG.LNE_PURPOSES_OF_CREDIT (CODE VARCHAR2(120) PRIMARY KEY, CODE303 VARCHAR2(120), NAME VARCHAR2(2048), NAME303 VARCHAR2(2048) );
CREATE TABLE TBG.LNE_COLLAT_AGR_KIND_C (DESCRIPTION VARCHAR2(1024), KIND_AGR_C VARCHAR2(120) PRIMARY KEY, NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_COLLATERAL (ACC_ID VARCHAR2(100), ACC_MATERIAL_ID VARCHAR2(100), ACCT_ID NUMBER(22), AGR_NO NUMBER(22), AGR_UID VARCHAR2(152), BRANCH VARCHAR2(32), CATEGORY NUMBER(22), COEFF NUMBER(22), COEFF_VALUATION NUMBER(22), COLLATERAL_END_DATE DATE, COLLATERAL_KIND VARCHAR2(120), COLLATERAL_NO VARCHAR2(80), COLLATERAL_START_DATE DATE, COLLATERAL_SUM NUMBER(22), COLLATERAL_SUM_REAL NUMBER(22), COLLATERAL_TYPE VARCHAR2(120), COLLATERAL_VZSK NUMBER(22), CREATED TIMESTAMP(6), CREATED_BY VARCHAR2(120), CREDIT_COLLAT VARCHAR2(4), CURRENCY_NO VARCHAR2(12), DESCR VARCHAR2(960), EXCLUDING_COND VARCHAR2(4), FAIR_SUM NUMBER(22), FAIR_SUM_FULL NUMBER(22), FLAG_UPD VARCHAR2(4), GR_ACT VARCHAR2(20), LAST_DOCUM_NO NUMBER(22), MAIN_COLLATERAL_NO VARCHAR2(80), MAIN_NO NUMBER(22), MAIN_SIGNED DATE, NEXT_PLEDGE_COND VARCHAR2(4), NO NUMBER(22) PRIMARY KEY, NOTARIAL_AGR_FLAG VARCHAR2(4), NOTARIAL_FILE_NAME VARCHAR2(1024), NOTARIAL_REG_DATE DATE, NOTARIAL_REG_DOC VARCHAR2(128), NOTARIAL_SEND_DATE DATE, NOTIF_ID_C VARCHAR2(512), NOTIF_REF_NUM_C VARCHAR2(240), NOTIF_TYPE VARCHAR2(120), OWN_ADDR VARCHAR2(960), OWN_DOC VARCHAR2(960), OWN_KIND VARCHAR2(120), OWN_NAME VARCHAR2(400), OWN_TAXN VARCHAR2(80), PATTERN VARCHAR2(120), PATTERN_TYPE VARCHAR2(120), PORUCH_NO NUMBER(22), PROPORTION NUMBER(22), SIGNED DATE, STATUS VARCHAR2(4), TOBS_NO VARCHAR2(80), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120), WRITE_OFF_DATE DATE );
CREATE TABLE TBG.LNE_DEBT_REASONS (CODE VARCHAR2(120) PRIMARY KEY, DESCR VARCHAR2(2048), MODIFIED TIMESTAMP(6), MODIFIED_BY VARCHAR2(160) );
CREATE TABLE TBG.LNE_BORROWER_TYPE_C (BORROWER_TYPE_C VARCHAR2(120) PRIMARY KEY, DESCRIPTION VARCHAR2(1024), NAME VARCHAR2(1024) );
CREATE TABLE TBG.LNE_PORTF_CODE_303_C (CODE_303_C VARCHAR2(120) PRIMARY KEY, DESCRIPTION VARCHAR2(1020), NAME VARCHAR2(1020) );
CREATE TABLE TBG.LNE_COMISS_SCH (ACC_AMORT_COM VARCHAR2(100), ACC_COM VARCHAR2(100), ACC_DOH_COM VARCHAR2(100), ACC_NACH_COM VARCHAR2(100), ACT_FLAG VARCHAR2(4), AMORTIZATION_FLG VARCHAR2(4), ATTRIBUTE VARCHAR2(120), BRANCH VARCHAR2(32), CALC_BALANCE_TYPE VARCHAR2(120), CM_CODE VARCHAR2(120), COM_PERIOD VARCHAR2(120), CPAY_AMOUNT NUMBER(22), CTYPE VARCHAR2(120), DESCR VARCHAR2(400), EPS_FLG VARCHAR2(4), FIX_SUM VARCHAR2(200), FRACTION_COUNT VARCHAR2(4), FRE_SUM NUMBER(22), GR_COMM_C VARCHAR2(120), HOLIDAY_C VARCHAR2(120), INCL_IN_SCHED VARCHAR2(4), INCLUSION_TYPE_C VARCHAR2(120), MAX_AMOUNT NUMBER(22), MIN_AMOUNT NUMBER(22), MODULE VARCHAR2(120), NACH_TYPE VARCHAR2(4), NDS NUMBER(22), PARTIAL_FLAG VARCHAR2(4), PERIOD_DAY NUMBER(22), PERIOD_WD VARCHAR2(12), PMT_CODE_C VARCHAR2(120), PP VARCHAR2(4), ROUNDING_METHOD VARCHAR2(120), SHIFT_CALC_COND VARCHAR2(120), SHIFT_CALC_PERIOD_N NUMBER(22), SHIFT_CALC_PERIOD_UNIT VARCHAR2(120), START_DATE DATE PRIMARY KEY, SUM_TYPE VARCHAR2(120), UPDATED TIMESTAMP(6), UPDATED_BY VARCHAR2(120), USE_ACCR_SETTING_COND VARCHAR2(4), USE_TYPE_C VARCHAR2(120), VID_COM VARCHAR2(120) );
CREATE TABLE TBG.LNE_SCHEDULE_HIST (AGR_NO NUMBER(22), AMOUNT NUMBER(22), AMOUNT_TYPE VARCHAR2(120), BILL_FLAG VARCHAR2(4), BRANCH VARCHAR2(32), CM_CODE VARCHAR2(120), HIST_ID NUMBER(22) , MODIFIED TIMESTAMP(6), MODIFIED_BY VARCHAR2(120), OPER_NO NUMBER(22), PAY_AMOUNT NUMBER(22), PER_FLAG VARCHAR2(4), PROC_DATE DATE, SCHED_ID NUMBER(22) PRIMARY KEY, STATUS_C VARCHAR2(4) );