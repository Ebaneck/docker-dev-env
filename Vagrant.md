Prerequisites
-------------
Using docker as development environment is questionable.

#This manual adds vagrant as a proper dev environment for developers.
#The necessary development packages for c++ and python have been included
#this is a current work in progress

1.  Install Virtual Box for your host operating system

    https://www.virtualbox.org

2.  Install Vagrant for your host operating system

    https://www.vagrantup.com

Installation Steps

vagrant build:

    ```
    $ git clone https://gitlab.com/Ebaneck/docker-ci_storelift.git
    $ cd docker-ci_storelift
    $ vagrant up
    ```


3.  Restart your new virtual computer and login:

    ```
    $ vagrant reload
    ```

    Username: vagrant
    Password: vagrant

