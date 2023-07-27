#/bin/bash
#
# Licensed Materials - Property of IBM
# 5747-SM3
# (c) Copyright IBM Corp. 2017,2018  All Rights Reserved.
# US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#

# Set DB2 performance parameters
export CUR_COMMIT=ON
su - db2inst1 -c "db2set DB2_WORKLOAD=FILENET_CM"
echo "set CUR_COMMIT=$CUR_COMMIT"

# Change file ownership and folder permissions for non-root execution
chown db2inst1:db2iadm1 /database/config/db2inst1/*.sh
chown db2inst1:db2iadm1 /database/config/db2inst1/*.sql
chmod 755 /database/config/db2inst1/*.sh
chown -R db2inst1:db2iadm1 /db2fs

# Run the database creation script
echo "Begin to create OS2DB database"
su - db2inst1 -c "/database/config/db2inst1/OS2DB.sh OS2DB"

TIME_OUT=15
i=0
if [[ $i -eq $TIME_OUT*2 ]]; then
       echo "Database create can't start within 30 minutes, something must be wrong, exit now..."
       echo "Pls check DB2 docker container log to check its status."
       exit 1
fi
while(($i<$TIME_OUT*2))
do
      number_of_db=`su - db2inst1 -c "db2 list db directory" | grep "Number of entries in the directory" | awk -F '=' '{print $2}'`
      if [ "$number_of_db"x = ""x -o $number_of_db -lt 4 ]; then
        let i++
        echo -e " $i.DB2 is not ready yet, wait 30 seconds and recheck again...."
        sleep 30

      else
        echo -e "\033[36mOS2DB database created successfully \033[0m"
        break
      fi
done
