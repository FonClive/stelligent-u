#!/bin/bash
ACC="891376970337"
FILE="instance.xls"
echo -e "Account;EC2"

for account in ${ACC}
do 
    EC2_INSTANCE_NAME=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].{PrivateIP:PrivateDnsName,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --output text)
    echo "${EC2_INSTANCE_NAME}"  >> ${FILE}
done   


# ACC=$(cat ~/.aws/credentials | egrep "\[.*\]" | cut -d '[' -f2 | cut -d ']' -f1 | grep -v default | sort)
# # FILE="${HOME}/ec2.csv"

# # echo -e "ACCOUNT;EC2" > ${FILE}

# # for account in ${ACC}
# # do
# #     for region in $(aws ec2 describe-regions --profile default --region sa-east-1 --output text | cut -f3)
# #     do
# #         EC2=$(aws ec2 describe-instances --profile ${account} --region ${region} --query "Reservations[*].Instances[*].{PrivateIP:PrivateDnsName,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --output text)
# #         echo -e "${account};${EC2}" >> ${FILE}
# #     done
# # done