export ACCOUNT_ID
export HOSTED_ZONE_ID = Z012246022TOM5F66YLQS
export AWS_REGION = ap-southeast-2
export BLUE_REPO_NAME = mayu-weatherapp-blue
export GREEN_REPO_NAME = mayu-weatherapp-green
export CLUSTER_NAME = mayu-weatherapp-cluster
export BLUE_SERVICE_NAME = mayu-weatherapp-blueservice
export GREEN_SERVICE_NAME = mayu-weatherapp-greenservice

.PHONY:	green_deploy
green_deploy:	login_ecr	green_build_image	green_push_image	green_update_ecs

.PHONY:	blue_deploy
blue_deploy:	login_ecr	blue_build_image	blue_push_image	blue_update_ecs

login_ecr:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

green_build_image:
	docker build --platform linux/amd64 -t $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(GREEN_REPO_NAME):latest .

green_push_image:
	docker push $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(GREEN_REPO_NAME):latest

green_update_ecs:
	aws ecs update-service --cluster ${CLUSTER_NAME} --service ${GREEN_SERVICE_NAME} --force-new-deployment --region ${AWS_REGION}

blue_build_image: 
	docker build --platform linux/amd64 -t $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(BLUE_REPO_NAME):latest .

blue_push_image:
	docker push $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(BLUE_REPO_NAME):latest

blue_update_ecs:
	aws ecs update-service --cluster ${CLUSTER_NAME} --service ${BLUE_SERVICE_NAME} --force-new-deployment --region ${AWS_REGION}
