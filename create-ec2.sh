#!/bin/bash
NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
INSTANCE_TYPE=""
IMAGE_ID=ami-03265a0778a880afb
SECURITY_GROUP_ID=sg-0eabcbb9daa289571

for i in "${NAMES[@]}"
do
  if [[ $i == "mongodb" || $i == "mysql" ]]
  then
     INSTANCE_TYPE="t3.medium"
  else
     INSTANCE_TYPE="t2.micro"
  fi 
 echo "creating : $i instance"
  IP_ADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID  --instance-type t2.micro  --security-group-ids  $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r 'Instances[0].PrivateIpAddress')
   echo "creating : $i instance : $IP_ADDRESS"

done 