# DevOps Challenge

DevOps project to build an infrastructure using terraform and Setup in AWS ECS Fargate.

## Summary

  - [Introduction](#introduction)
      - [Principal resources used](#principal-resources-used)
      - [Pre-requisites](#pre-requisites)
  - [Install Instructions](#instal-instructions)
  - [Usage](#usage)
      - [Instructions to run the Application](#instructions-run-app)
      - [Instructions to run Infrastructure Project](#instructions-run-infrastructure-project)
  - [Setup](#setup)
  - [Requirements to Production](#requirements-to-production)
  - [Considerations](#Considerations)
  - [Potential Improvements](#potential-improvements)
  - [Author](#author)
  - [License](#license)

## Introduction

This section describes the dependencies used in the application and the infrastructure, instructions on how to start the project, setup, and configuration of the environment for deployment.

### Principal resources used

* [Python](https://www.python.org/) - Programming language used, in version 3.9.9
* [Docker](https://www.docker.com) - Container creation tool to ease the application packaging process.
* [Terraform](https://www.terraform.io/) - A tool to create, modifying and versioning infrastructure with securely and efficiently.
* [AWS ECS Fargate](https://aws.amazon.com/fargate/) - Technology that can be used with Amazon ECS to run containers. 
*  [GitLab](http://gitlab.com) - Repository of the code versioning.

### Pre-requisites

What was need to run the project:

- Python version 3.9.9
- Git installed
- Gitlab account
- Docker
- Terraform v1.0.11
- AWS account

## Install Instructions

## Setup

## Usage
### Instructions to run the Application

Steps to run the application:

- Clone in project:
```
git clone git@gitlab.com:bbeckerdarosa/devops-challenge.git
```

- Access the project directory and run the application using docker:
```
cd devops-challenge/

docker build -t <user_docker_hub>/fargate-application-version .

docker run --rm -it -p 5000:5000 <user_docker_hub>/fargate-application-version
```

### Instructions to run Infrastructure Project


## Requirements to Production

## Considerations

## Potential Improvements

## Author

* **Bárbara Becker da Rosa** -  [GitHub](https://github.com/bbeckerdarosa)

<a href="https://github.com/bbeckerdarosa">
  <img 
  alt="Image of Bárbara Becker" src="https://avatars1.githubusercontent.com/u/39573350?s=460&v=4" width="100">
</a>

## License