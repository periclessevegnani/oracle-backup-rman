#!/bin/sh
. ../parametros_oracle.sh

rman target / <<EOF 1>> ${ARQ_LOG_ARCH} 2>> ${ARQ_LOG_ARCH}
show all;
run {
  allocate channel d1 type disk format '${DIR_ARQUIVOS}/arch_%d_%s_%p_%T_dbid_%I.bkp' maxpiecesize 4G;
  crosscheck archivelog all;
  sql 'alter system archive log current';
  backup as compressed backupset tag 'BackupArchivelogDiario' archivelog all not backed up 1 times delete input;
  delete noprompt expired archivelog all;
  delete noprompt archivelog all backed up 1 times to device type disk completed before 'sysdate-1';
  release channel d1;
}
exit
EOF

