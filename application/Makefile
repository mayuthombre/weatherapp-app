export ACCOUNT_ID
AWS_REGION = ap-southeast-2
BLUE_REPO_NAME = mayu-weatherapp-blue
GREEN_REPO_NAME = mayu-weatherapp-green
CLUSTER_NAME = mayu-weatherapp-cluster
BLUE_SERVICE_NAME = mayu-weatherapp-blueservice
GREEN_SERVICE_NAME = mayu-weatherapp-greenservice

.PHONY: blue_build_image
blue_build_image: 
	docker build --platform linux/amd64 -t $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(BLUE_REPO_NAME):latest .

.PHONY: login_ecr
login_ecr:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

.PHONY: green_push_image
green_push_image:
	docker push $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(GREEN_REPO_NAME):latest

.PHONY: green_update_ecs
green_update_ecs:
	aws ecs update-service --cluster ${CLUSTER_NAME} --service ${GREEN_SERVICE_NAME} --force-new-deployment --region ${AWS_REGION}

.PHONY: blue_push_image
blue_push_image:
	docker push $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(BLUE_REPO_NAME):latest

.PHONY: blue_update_ecs
blue_update_ecs:
	aws ecs update-service --cluster ${CLUSTER_NAME} --service ${BLUE_SERVICE_NAME} --force-new-deployment --region ${AWS_REGION}

.PHONY: green_build_image
green_build_image:
	docker build --platform linux/amd64 -t $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(GREEN_REPO_NAME):latest .