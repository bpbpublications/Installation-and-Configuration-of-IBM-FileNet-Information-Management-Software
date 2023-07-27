#!/bin/bash
#
# Licensed Materials - Property of IBM
# 5747-SM3
# (c) Copyright IBM Corp. 2017, 2018  All Rights Reserved.
# US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
echo "=========================================="
date
if [[ $ScriptsDir = "" ]]; then
        source ./d_utils.sh
        echo $ScriptsDir
fi
echo "Begin to deploy OS2DB to $DB2_IMAGE_NAME:$DB2_IMAGE_TAG Container $DB2_CONTAINER_NAME"
start_time_1=$(date +%s)
filename=$ScriptsDir/"status.log"

function copyDB2ConfigFiles() {
        echo "Copy DB2 configuration files start..."
        cd $ScriptsDir/config-files/DB2
        cp -f OS2DB.sh setup_db2_for_OS2DB.sh $DB2_CONFIGFILES_LOC/$DB2_SCRIPT
         cp -f ../CPE/OS2DB.xml $CPE_CONFIGFILES_LOC/$CPE_OVERRIDES_FOLDER
         chown -R $U_UID:$G_GID $CPE_CONFIGFILES_LOC
         chmod -R 777 $CPE_CONFIGFILES_LOC
        cd $ScriptsDir
        echo "Copied DB2 configuration files to $DB2_CONFIGFILES_LOC successfully"
}

function createDB() {
  echo "Begin to create the OS2DB database..."
  containerID=`docker ps -a -q --filter name=$DB2_CONTAINER_NAME$`
  docker cp $DB2_CONFIGFILES_LOC/$DB2_SCRIPT/OS2DB.sh $containerID:/database/config/db2inst1
  docker cp $DB2_CONFIGFILES_LOC/$DB2_SCRIPT/setup_db2_for_OS2DB.sh $containerID:/database/config/db2inst1
  docker exec -i $DB2_CONTAINER_NAME /bin/bash /database/config/db2inst1/setup_db2_for_OS2DB.sh

if [ ! $? -eq 0 ] ;then
          echo -e "\033[31mFailed to create the database OS2DB. \033[0m"
          exit_script
  fi
}
copyDB2ConfigFiles
createDB
end_time_1=$(date +%s)
duration_1=$((($end_time_1-$start_time_1)/60))
echo -e "\033[36mCreate database OS2DB took $duration_1 minutes \033[0m"
if [ $? -eq 0 ] ;then
    echo -e "\033[36mFinished create database OS2DB successfully \033[0m"
         sed -i.bak 's/deployDB2: NotCompleted/deployDB2: Completed/g' $filename
else
    exit_script
fi
echo "=========================================="
