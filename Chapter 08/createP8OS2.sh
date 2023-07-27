#!/bin/bash
#
# Licensed Materials - Property of IBM
# 5747-SM3
# (c) Copyright IBM Corp. 2017, 2018  All Rights Reserved.
# US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
echo "=========================================="
date
filename=$ScriptsDir/"status.log"

if [[ $ScriptsDir = "" ]]; then
        source ./d_utils.sh
        echo $ScriptsDir
fi
echo "Begin to create p8 object store with name P8OS2Centos8"

CPELibs=$ScriptsDir/CPELibs
if [[ -d $CPELibs ]]; then
        p8utils=$ScriptsDir/p8utils.jar:$CPELibs/Jace.jar:$CPELibs/log4j.jar:$CPELibs/stax-api.jar:$CPELibs/xlxpScanner.jar:$CPELibs/xlxpScannerUtils.jar
else
        echo "There is no folder named $CPELibs"
fi

docker exec -i $JDK_CONTAINER_NAME java -cp $p8utils com.ibm.CETools "createObjectStore" $HOST_NAME $CPE_HTTP_PORT $P8ADMIN_USER $GLOBAL_PASSWORD P8OS2Centos8 "FNOS2DS" "FNOS2DSXA" $P8ADMIN_GROUP "GeneralUsers" "" ""
if [ ! $? -eq 0 ] ;then
   echo -e "\033[31m Something wrong when creating P8 Object Store. \033[0m"
   echo -e "\033[31m Check $CPE_CONFIGFILES_LOC/$CPE_LOGS_FOLDER/$CPE_CONTAINER_HOST_NAME/messages.log to see if any error \033[0m"
                exit_script
fi

if [ $? -eq 0 ] ;then
        echo -e "\033[36mFinished creating p8 object store P8OS2Centos8 successfully \033[0m"
        sed -i.bak 's/createP8OS2: NotCompleted/createP8OS2: Completed/g' $filename
else
        exit_script
fi
echo "==========================================
