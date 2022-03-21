# UdacityDevOpsCapstone
[![CircleCI](https://circleci.com/gh/vitas-pm/UdacityDevOpsCapstone.svg?style=svg)](https://circleci.com/gh/vitas-pm/UdacityDevOpsCapstone)

Repo for the Capstone Project of the Udacity Cloud DevOps Nano Degree

## Steps in Completing Your Project
### Step 1: Propose and Scope the Project

Plan what your pipeline will look like.
- AWS EKS cluster prepared, every commit will lint, create a new docker image and deploy it to the cluster.

Decide which options you will include in your Continuous Integration phase. Use either Circle CI or Jenkins.
- CircleCI

Pick a deployment type - either rolling deployment or blue/green deployment.
- Rolling

For the Docker application you can either use an application which you come up with, or use an open-source application pulled from the Internet, or if you have no idea, you can use an Nginx “Hello World, my name is (student name)” application.
- The browser game 2048 by [Gabriele Cirulli](https://github.com/gabrielecirulli/2048)

### Step 2: Use Jenkins or Circle CI, and implement blue/green or rolling deployment.

If you're using Jenkins, create your Jenkins master box and install the plugins you will need.
- Not using Jenkins

If you're using Circle CI, set up your circle CI account and connect your git repository.
- Done

Set up your environment to which you will deploy code.
- Done

### Step 3: Pick AWS Kubernetes as a Service, or build your own Kubernetes cluster.

Use Ansible or CloudFormation to build your “infrastructure”; i.e., the Kubernetes Cluster.
- Cluster built with eskctl using a “cheap” setting. See [create_cluster.sh](create_cluster.sh)

It should create the EC2 instances (if you are building your own), set the correct networking settings, and deploy software to these instances.
- Initial software deployed with [run_docker.sh](run_docker.sh) and [run_kubernetes.sh](run_kubernetes.sh)

As a final step, the Kubernetes cluster will need to be initialized. The Kubernetes cluster initialization can either be done by hand, or with Ansible/Cloudformation at the student’s discretion.
- Done

### Step 4: Build your pipeline

Construct your pipeline in your GitHub repository.
- Pipeline is in [.circleci/config.yml](.circleci/config.yml)

Set up all the steps that your pipeline will include.
- Done

Configure a deployment pipeline.
- Done

Include your Dockerfile/source code in the Git repository.
- Done

Include with your Linting step both a failed Linting screenshot and a successful Linting screenshot to show the Linter working properly.
- see [success](images/lint_success.png) and [fail](images/lint_fail.png)

### Step 5: Test your pipeline

Perform builds on your pipeline.
- Done, a lot

Verify that your pipeline works as you designed it.
- It does

Take a screenshot of the Circle CI or Jenkins pipeline showing deployment, and a screenshot of your AWS EC2 page showing the newly created (for blue/green) or modified (for rolling) instances. Make sure you name your instances differently between blue and green deployments.
- The CircleCI pipeline can be seen in [pipeline](images/pipeline.png), [lint_success](images/lint_success.png), 
[docker_success](images/docker_success.png) and [kubernetes_success](images/kubernetes_success.png)
- See [pod_changed](images/pod_changed.png) and [pod_to_v1.4](images/pod_to_v1.4.png) showing that browser-game had a 
rolling update about 38 minutes ago. Those are of the EKS page, since it's clearer than on the EC2 page.
- The website is deployed on [http://a46c52c67777a4d6dbe5a07753422687-1870156947.us-east-1.elb.amazonaws.com](http://a46c52c67777a4d6dbe5a07753422687-1870156947.us-east-1.elb.amazonaws.com)
- Each commit increases the game's version using [increase_version.sh](increase_version.sh)
- Screenshot [rollback](images/rollback.png) shows the process of a rollback if anything breaks during the last
part of the deployment. Here the game was upgraded to v1.5 but then rolled back to v1.4. Although the game will
be updated again once I push these changes to the repository.
