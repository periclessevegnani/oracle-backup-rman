#!/bin/sh
. ../parametros_oracle.sh

rman target / <<EOF 1>> ${ARQ_LOG_FULL} 2>> ${ARQ_LOG_FULL}
show all;
run {
  allocate channel d1 type disk format '${DIR_ARQUIVOS}/df_%d_%s_%p_%T_dbid_%I.bkp' maxpiecesize 4G;
  backup as compressed backupset tag 'BackupFull' database plus archivelog;
  backup tag 'BackupControlFile' current controlfile format '${DIR_ARQUIVOS}/cf_%d_%s_%p_%T_dbid_%I.bkp';
  backup tag 'BackupSPFile' spfile format '${DIR_ARQUIVOS}/sp_%d_%s_%p_%T_dbid_%I.bkp';
  delete noprompt obsolete;
  delete noprompt expired backup;
  delete noprompt expired copy;
  release channel d1;
}
exit
EOF

