export ACCOUNT_ID
AWS_REGION = ap-southeast-2
REPO_NAME = mayu-weatherapp-repo
CLUSTER_NAME = mayu-weatherapp-cluster
GREEN_SERVICE_NAME = mayu-weatherapp-green

.PHONY: build_image
build_image: 
	docker build --platform linux/amd64 -t $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(REPO_NAME):green .

.PHONY: login_ecr
login_ecr: 
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

.PHONY: push_image
push_image: 
	docker push $(ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(REPO_NAME):green

.PHONY: green_update_ecs
update_ecs:
	aws ecs update-service --cluster ${CLUSTER_NAME} --service ${GREEN_SERVICE_NAME} --force-new-deployment --region ${AWS_REGION}
