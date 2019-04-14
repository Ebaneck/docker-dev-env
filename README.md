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

- ansible_docker_provision
Contains ansible playbook to provision a developer environment. A readme is included on how to get started

- apps
Contains demo helloworld applications both in C++ and in python(django)
For this exercise, we will be using the cpp application to build, test and deploy a release image with tags to our image registry

- dev
Contains instructions on how to build deployment and dev images. This is where we package our images with the various tools

- Gitlab
Contains instructions on how to deploy and host an in-house gitlab with runners and docker capabilities

- provision_vagrant
Contains scripts on how to provision a vagrant box with development tools. Only python dev environment has been completed using `ansible` as the provisioner

# Getting started for Developers

As a developer, to get started developing our amazing solution is super simple.

1. Clone this repository in you home directory using

```
git clone https://github.com/Ebaneck/docker-dev-env.git

cd docker-dev-env
```

2. Install ansible on your host machine using

```
sudo apt-get install ansible
```

3. Run the playbook that will build developers environment

```
ansible-playbook -i inventory.yml playbook.yml
```

4. To connect to dev environment, use

```
docker exec -it storelift_dev bash -l
```

5. TO destroy you dev environment, use below
Note: Destroying the container with commiting your work to version control(gitlab) is dangerous

```
ansible-playbook destroy.yml
```