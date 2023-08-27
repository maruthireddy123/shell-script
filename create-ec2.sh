#!/bin/bash
NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
INSTANCE_TYPE=""
SECURITY_ID=sg-05dc3a3cddb80301f
IMAGE_ID=ami-03265a0778a880afb

#write a for loop that we need t3.medium for mongodb mysql...
for i in "${NAMES[@]}"
do 
if [ [ $i == "mongodb" || "$i == "mysql" ] ]
then
INSTANCE_TYPE="t3.medium"
else 
INSTANCE_TYPE="t2.micro"
fi
echo "creating a $i instance"

aws ec2 run-instances --image-id $IMAGE_ID  --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_ID --tag-specifications "ResourceType=instance,Tags="[{Key=Name,Value=$i}]"
done