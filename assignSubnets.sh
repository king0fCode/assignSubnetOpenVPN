#!/bin/bash


# start predfined values 
GroupSubnetName="S_E74"
CIDR=29
NetworkAddress=173.82.43.72
# end predfined values



users="./"$GroupSubnetName"/users.txt"
ipList="./"$GroupSubnetName"/ips.txt"
subnetCDR=$NetworkAddress"/"$CIDR

# NOTE: Be sure to run this script with `sudo`.
echo "users path"$users;
echo "IPs path "$ipList;


#i=1; # Count variable to cal IP Range 

# Read user and password
while read iuser ip; do


GroupName="G_E74"
echo "-------------"
echo $i
echo "Assigning Static IP"


echo  $iuser
echo  $ip
echo  $subnetCDR

#Add a new user from scratch:
#./sacli --user $iuser --key "type" --value "user_connect" UserPropPut



if [[ $i -eq 1 ]]
then
  echo $GroupName


#Create a new group from scratch:
#./sacli --user $GroupName --key "type" --value "group" UserPropPut
#./sacli --user $GroupName --key "group_declare" --value "true" UserPropPut

# Assign a primary subnet for static IP addressing space to a group:
#./sacli --user $GroupName --key $GroupSubnetName --value $subnetCDR UserPropPut

fi


#Add a user to a group:
#./sacli --user $iuser --key "conn_group" --value  $GroupName UserPropPut


# Assign a user a static IP address:
#./sacli --user $iuser --key "conn_ip" --value $ip UserPropPut


./sacli --user $iuser UserPropDelAll


i=$((i+1))




done < <(paste $users $ipList)




