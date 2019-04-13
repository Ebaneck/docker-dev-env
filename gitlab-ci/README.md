
Prerequisites
-------------

1.  Install Virtual Box for your host operating system

    https://www.virtualbox.org

2.  Install Vagrant for your host operating system

    https://www.vagrantup.com

Installation Steps

Ansible  build:

    ```
    $ cd docker-ci_storelift/gitlab-ci
    $ ansible-playbook -i hosts prepare-gitlab.yml
    ```


References

- https://blog.codecentric.de/en/2018/05/gitlab-ci-pipeline/
- https://medium.com/devopslinks/c-development-environment-with-docker-and-gitlab-bc824d0b4e35