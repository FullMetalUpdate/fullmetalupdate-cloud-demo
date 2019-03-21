#!/bin/bash

# Set-up a target with a known token for the demo
curl -X POST \
 http://localhost:8080/rest/v1/targets --user admin:admin \
 -H 'Content-Type: application/json' \
 -H 'cache-control: no-cache' \
 -d '[ { 
 "securityToken" : "380ff2b5908e776cb69159f3f4477e4f", 
 "controllerId" : "i.MX6_Demo", 
 "name" : "i.MX6_Demo" 
} ]' 

# Set-up the polling time to 30 seconds
curl -X PUT \
 http://localhost:8080/rest/v1/system/configs/pollingTime/ --user admin:admin \
 -H 'Content-Type: application/json' \
 -H 'cache-control: no-cache' \
 -d '{ 
 "value" : "00:00:30"
}' 

# Enable authentication using tokens
curl -X PUT \
 http://localhost:8080/rest/v1/system/configs/authentication.targettoken.enabled/ --user admin:admin \
 -H 'Content-Type: application/json' \
 -H 'cache-control: no-cache' \
 -d '{ 
 "value" : true
}' 

