# docker-dev-env
mettre en place un système afin de géré un environnement de dev pour lancer un pipeline de test, utilisé de la code révision et pouvoir notifié les utilisateurs.

# Requirements
- Ubuntu18 servira pour la VM de dev, les outils pour coder en C++/Python seront requis.
- Docker sera la principale composante pour la mise en place d'environnement,
- L'utilisation d'un gestionnaire comme Ansible est recommandé.
- Gitlab peut servir pour la code révision et Runner pour les tests.
- Concernant les notifications il sera préférable d'utiliser des notifications Slack

# Outcome
Cet environnement sera duplicable et déployable facilement.

# Directory layout and contains

### ansible_docker_provision:

Contains ansible playbook to provision a developer environment. Steps on how to get started is included below

### apps:

Contains demo helloworld applications both in C++ and in python(django)
For this exercise, we will be using the cpp application to build, test and deploy a release image with tags to our image registry  [Link](https://gitlab.com/Ebaneck/demo_apps)

```
https://gitlab.com/Ebaneck/demo_apps 

```
The pipeline to build the above C++ application is described here 
[Gitlab C++ CI/CD pipeline](https://raw.githubusercontent.com/Ebaneck/docker-dev-env/master/img/pipeline.png)

### dev:

Contains instructions on how to build and deploy our compiled docker images. This is where we package our images with the various tools [Link](https://gitlab.com/Ebaneck/docker-ci_storelift)

These images are built automatically on each push and published to our gitlab registry. Two types of images are kept in the registry.
- Build images(ready made image for deploying our applications)
- Dev Images (required Images for building a developer development environment)

Here is  a look of the current images in the registry: [Gitlab image registry ](https://raw.githubusercontent.com/Ebaneck/docker-dev-env/master/img/registry.png)

```
https://gitlab.com/Ebaneck/docker-ci_storelift 
```

### Gitlab:

Contains instructions on how to deploy and host an in-house gitlab with runners and docker capabilities. A work in progress!!

### provision_vagrant:

Contains scripts on how to provision a vagrant box with development tools. Only python dev environment has been completed using `ansible` as the provisioner

# Getting started for Developers(Linux debian + Ubuntu)

As a developer, to get started developing our amazing solution, follow the steps below.

1. Clone this repository in you home directory using

```
git clone https://github.com/Ebaneck/docker-dev-env.git

cd docker-dev-env/ansible_docker_provision
```

2. Install ansible on your host machine using

```
sudo apt-get install ansible
```

3. Run the playbook that will build developers environment

```
ansible-playbook -i inventory.yml playbook.yml
```
Once the playbook is complete, we can verify that a dev docker container is running using

```
docker ps -a
```

4. To connect to dev environment, use

```
docker exec -it storelift_dev bash -l
```

# Voila! Complete dev environment ready

[Connect as Storelift developer](https://raw.githubusercontent.com/Ebaneck/docker-dev-env/master/img/connect_docker.png)

[Run IDE for C++](https://raw.githubusercontent.com/Ebaneck/docker-dev-env/master/img/qtcreator.png)

The above are example outcomes when the developer environment has been setup completely.

## Danger :)

5. To destroy your dev environment, use below
Note: Destroying the container without commiting your work to version control(gitlab) is not tolerated

Remedy:
We could mount a host volume, so that developers can store their work on the host machine directly.

```
ansible-playbook destroy.yml
```

# Slack notification intergration

We have integrated slack as webhooks to gitlab, making it possible to receive updates when a build is started, failed or complete.

## Adding slack for notifications

To add slack notifications to our build pipeline;

i. Go to the Settings/Integrations on gitlab

ii. Select slack notifications

iii. Choose the notification type ie git merge events, git push events etc
- You will need to add a webhook call back url gotten from a slack app below

iv. Head over to slack and create a new slack channel

v.  Now go to the slack api and create a new slack application

vi. Obtain the incoming webhooks generated for the slack application and add this field to gitlab in (iii.) above

vii. Click the test and deploy button to save

Now, you should have slack notifications intergrated to gitlabs and working correctly like below

[Slack CI notifications preview](https://raw.githubusercontent.com/Ebaneck/docker-dev-env/master/img/slack%20notif.png)

# Recommendations

Docker today looks like a great option for creating Dev Environment, but I still think virtual box with vagrant provisioned using ansible is a better and stable alternative to building long term Dev Development environment.

I have included a proof of concept using vagrant, ansible and virtualbox in `provision_vagrant` directory

Thanks for reading through. Feel free to raise any issues you may have. 
