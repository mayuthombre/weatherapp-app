#!/bin/bash
green=$(aws route53 list-resource-record-sets --hosted-zone-id Z012246022TOM5F66YLQS --query "ResourceRecordSets[?SetIdentifier == 'green']")
blue=$(aws route53 list-resource-record-sets --hosted-zone-id Z012246022TOM5F66YLQS --query "ResourceRecordSets[?SetIdentifier == 'blue']")
echo $green | jq -r '.[].Weight' > valgreen
valgreen=`cat valgreen`
echo $blue | jq -r '.[].Weight' > valblue
valblue=`cat valblue`
if [ $valgreen -eq 0 ]
then
    echo "test"
elif [ $valblue -eq 0 ]
then
    echo "test2"
else
    echo "error"
    exit 0
fi