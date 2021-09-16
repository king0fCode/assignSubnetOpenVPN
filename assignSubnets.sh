#!/bin/bash


# start predfined values 

users="./users.txt"
ipList="./ips.txt"
GroupName="ClientGroup" 
# end predfined values

# NOTE: Be sure to run this script with `sudo`.
echo "users path  -> "$users;
echo "IPs path -> "$ipList;


## {ClientGroup, ClientGroup1, ClientGroup2} 


#@ Remove all properties (this deletes the user or group):
#./sacli --user "ClientGroup" UserPropDelAll {ClientGroup, ClientGroup1, ClientGroup2}


#i=1; # Count variable to cal IP Range 

# Read user and password
while read iuser ip; do




echo "-------------"
echo $i
echo "Assigning Static IP"
echo  $iuser
echo  $ip


#Add a new user from scratch:
/usr/local/openvpn_as/scripts/sacli --user $iuser --key "type" --value "user_connect" UserPropPut



#Add a user to a group:
/usr/local/openvpn_as/scripts/sacli --user $iuser --key "conn_group" --value  $GroupName UserPropPut


# Assign a user a static IP address:
/usr/local/openvpn_as/scripts/sacli --user $iuser --key "conn_ip" --value $ip UserPropPut


i=$((i+1))

done < <(paste $users $ipList)




