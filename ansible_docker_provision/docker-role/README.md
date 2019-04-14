Creating a playbook to create our docker container


So now we can run our playbook that we will create and run the role in it by running the following command:

```
ansible-playbook -i inventory.yml playbook.yml

```

If you want to enter your container at any time, you may run the docker cli command to interact directly with the container.

```
docker exec -it storelift_dev bash

```


To remove our container just run:

```
ansible-playbook destroy.yml
```