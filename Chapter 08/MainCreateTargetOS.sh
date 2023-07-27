#!/bin/bash
#
# Licensed Materials - Property of IBM
# 5747-SM3
# (c) Copyright IBM Corp. 2017, 2018  All Rights Reserved.
# US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
start_time_0=$(date +%s)
basepath=$(cd `dirname $0`; pwd)
ScriptsDir="$basepath/install-scripts"
chmod -R +x $ScriptsDir                               
chmod +x ./setProperties.sh
# read and execute commands from ./setproperties.sh and return.
source ./setProperties.sh
# create status.log keeps track of the script completion or non-completion
filename=$ScriptsDir/"status.log"
if [ ! -f $filename ]
then
        touch $filename
        echo " deployDB2_OS2DB: NotCompleted" >> $filename
        echo " createP8OS2: NotCompleted" >> $filename
else
        echo "Status file found"
        echo " deployDB2_OS2DB: NotCompleted" >> $filename
        echo " createP8OS2: NotCompleted" >> $filename
fi
source $ScriptsDir/utils.sh
source $ScriptsDir/getLicenseApproval.sh
source $ScriptsDir/gatherHostInfo.sh
source $ScriptsDir/getCredential.sh
# Check status of script and only execute if it is NotCompleted

if grep -q " deployDB2_OS2DB: Completed" $filename; then
    echo "Skipping deployDB2_OS2DB.sh, as it was completed during previous execution!"
else
    echo " deployDB2_OS2DB.sh was not run before, running now!"
        source $ScriptsDir/deployDB2_OS2DB.sh
fi

if grep -q " createP8OS2: Completed" $filename; then
    echo "Skipping createP8OS2.sh, as it was completed during previous execution!"
else
    echo "createP8OS2.sh was not run before, running now!"
        source $ScriptsDir/createP8OS2.sh
fi

end_time_0=$(date +%s)
duration_0=$((($end_time_0-$start_time_0)/60))
echo "This execution took $duration_0 minutes"
