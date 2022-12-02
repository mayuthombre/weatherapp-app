#!/bin/bash
green=$(aws route53 list-resource-record-sets --hosted-zone-id Z012246022TOM5F66YLQS --query "ResourceRecordSets[?SetIdentifier == 'green']")
blue=$(aws route53 list-resource-record-sets --hosted-zone-id Z012246022TOM5F66YLQS --query "ResourceRecordSets[?SetIdentifier == 'blue']")
echo $green | jq -r '.[].Weight' > valgreen
valgreen=`cat valgreen`
echo $blue | jq -r '.[].Weight' > valblue
valblue=`cat valblue`
if [ $valgreen -eq 0 ]
then
    echo "green" > ./application/test
    # export GITHUB_ENV="green"
    # echo $GITHUB_ENV
    #export $GITHUB_ENV = "green"
    # echo "No traffic found on GREEN. Deploying the application to GREEN environment"
    # docker build --platform linux/amd64 -t ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${GREEN_REPO_NAME}:latest .
    # aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
    # docker push ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${GREEN_REPO_NAME}:latest
    # aws ecs update-service --cluster ${CLUSTER_NAME} --service ${GREEN_SERVICE_NAME} --force-new-deployment --region ${AWS_REGION}
elif [ $valblue -eq 0 ]
then
    echo "blue" > test
    # export GITHUB_ENV="blue"
    # echo $GITHUB_ENV

    # echo "No traffic found on BLUE. Deploying the application to BLUE environment"
    # docker build --platform linux/amd64 -t ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${BLUE_REPO_NAME}:latest .
    # aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
    # docker push ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${BLUE_REPO_NAME}:latest
    # aws ecs update-service --cluster ${CLUSTER_NAME} --service ${BLUE_SERVICE_NAME} --force-new-deployment --region ${AWS_REGION}
else
    echo "error: Are you trying to break everything? Go back & fix weighted distribution in Route53"
    exit 0
fi