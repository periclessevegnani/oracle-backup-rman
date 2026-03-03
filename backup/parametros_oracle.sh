#!/bin/sh

# Configuracoes Oracle
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1
export ORACLE_SID=ORCL
export NLS_LANG=AMERICAN_AMERICA.WE8MSWIN1252
export NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'
export PATH=$ORACLE_HOME/bin:$PATH

# Diretorios RMAN
export DIR_BASE=/backup/rman
export DIR_ARQUIVOS=${DIR_BASE}/arquivos
export DIR_LOG=${DIR_BASE}/logs
export DIR_SCRIPT=${DIR_BASE}/scripts
export ARQ_LOG_FULL=${DIR_LOG}/RmanFull_`date '+%Y%m%d'`.log
export ARQ_LOG_ARCH=${DIR_LOG}/RmanArchivelog_`date '+%Y%m%d'`.log

