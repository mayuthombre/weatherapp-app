#!/bin/bash
green=$(aws route53 list-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID --query "ResourceRecordSets[?SetIdentifier == 'green']")
blue=$(aws route53 list-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID --query "ResourceRecordSets[?SetIdentifier == 'blue']")
echo $green | jq -r '.[].Weight' > valgreen
valgreen=`cat valgreen`
echo $blue | jq -r '.[].Weight' > valblue
valblue=`cat valblue`
if [[ $valgreen -eq 0 ]]
then
    echo "ENV_TO_DEPLOY=green" >> $GITHUB_ENV

elif [[ $valblue -eq 0 ]]
then
    echo "ENV_TO_DEPLOY=blue" >> $GITHUB_ENV

else
    echo "ENV_TO_DEPLOY=error" >> $GITHUB_ENV
    echo "error: Are you trying to break everything? Go back & fix weighted distribution in Route53"
    exit 0
fi