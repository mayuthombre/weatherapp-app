# Weatherapp application layer

This repository is used in conjunction with Weatherapp Infrastructure layer
https://github.com/mayuthombre/weatherapp-infra

It includes and supports the following functionality:

- Dockerfile and docker-compose configuration for 3M based deployments
- Node Weather App - https://github.com/phattp/nodejs-weather-app


## Blue/Green Deployment
The idea of blue green deployment has been around for quite some time. Main idea is that essentially we have two instances of application running at any given point in time. 

We have a blue instance which is serving all incoming traffic and green instances which are sitting idle.
So the idea is we can deploy a new version of traffic on the green instances. Do the UAT testing or PVT testing before migrating the traffic to the green environment. 

Once all testings are passed, we can cut over the entire traffic from blue to green just by chaning the load balancer behind the DNS. This is why you will also need the infrastructure layer of the application mentioned above.
https://github.com/mayuthombre/weatherapp-infra


## Getting Started
This GitHub template should be used to create your own repository. Repository will need to be public if you are creating it in your personal GitHub account in order to support approval gates in GitHub actions. Configure the following to get started:
* Clone your repository locally. It should have a branch named `blue-green`.
* Create an environment in your repository named `approval` to support GitHub Workflows, selecting `required reviewers` and adding yourself as an approver.
* Create GitHub Secrets in your repository for `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` `AWS_SESSION_TOKEN` and `HOSTED_ZONE_ID`if using temporary credentials.
* Use Makefile to add/update/change the run commands as needed. Makefile is stored within the application folder.
* Application folder also contains bash script file `deploy.sh`. This script is used to fetch the load balancer weights and make decision whether to deploy the newer version to blue environment or green environment
* Push local changes to the GitHub repos blue-green branch, which should trigger the Github deploy workflow.




Keep reading for in-depth details.

<br> 

3 Musketeers
The provided makefile, dockerfile , and docker-compose.yml files work together to create a docker container. It expects AWS account credentials to be passed as environment variables.


<br> 

## GitHub Actions / Workflows
The following workflows are provided in this repository. These are located under `.github/workflows`.

| Workflow | Description | Environments | Trigger
|----------|-------------|--------------|--------|
| app.yml | Build and push Docker image to ECR. | approval | on.push.branch [blue-green] ||

Note: Pushing to `blue-green` branch will trigger CI pipeline. 
Additionally, ONLY changes to the following files and paths will trigger a workflow.

```
      - 'application/**'
      - '.github/workflows/app.yml'
```

## GitHub Secrets
Create GitHub Secrets in your repository for `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` `AWS_SESSION_TOKEN` and `HOSTED_ZONE_ID` are required.

<br>

### Getting Started

This repository is contain code of my weather forecast application that you can predict the weather from a location.
This project is the part of [The Complete Node.js Developer Course](https://www.udemy.com/the-complete-nodejs-developer-course-2/) by Andrew Mead on Udemy.

Visit [Live Site](https://phatt-weather-app.herokuapp.com/)

### Installing

Install node modules.

```
npm install
```

### Running the App

Run this app in devlopment mode with command below and navigate to http://localhost:3000 to see the app.

```
npm run dev
```
