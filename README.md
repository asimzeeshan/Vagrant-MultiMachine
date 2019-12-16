# Vagrant-MultiMachine

This is a little experiment to fine-tune my ansible roles across multiple OS and I needed test boxes. Therefore, Vagrant.
Using this repo, Vagrant deploys multiple machines with (pre-defined) static IPs. All the definition is in ONE [**Vagrantfile**](Vagrantfile)

## How to use?

1. Clone this repo
2. Add your key in [**keys**](keys) directory
3. Edit the array on top of Vagrantfile to suit your needs. Save it
4. Run `vagrant up` and watch the magic happen
5. Login with `root@your-predefined-ip` or `vagrant@your-predefined-ip` or `vagrant ssh`

## Sample ansible host file
```
[vagrant]
debian10                         ansible_host=192.168.33.10     ansible_user=vagrant
debian9                          ansible_host=192.168.33.11     ansible_user=vagrant
ubuntu1804                       ansible_host=192.168.33.12     ansible_user=vagrant
ubuntu1910                       ansible_host=192.168.33.13     ansible_user=vagrant
CentOS7                          ansible_host=192.168.33.14     ansible_user=vagrant
CentOS8                          ansible_host=192.168.33.15     ansible_user=vagrant    ansible_python_interpreter=/usr/bin/python3
Fedora31                         ansible_host=192.168.33.16     ansible_user=vagrant
ubuntu1604                       ansible_host=192.168.33.17     ansible_user=vagrant
```


## OS Types

| ID            | Description           |
| ------------- | --------------------- |
| Ubuntu_64     | Ubuntu (64-bit)       |
| Ubuntu        | Ubuntu (32-bit)       |
| Debian_64     | Debian (64-bit)       |
| Debian        | Debian (32-bit)       |
| Fedora_64     | Fedora (64-bit)       |
| Fedora        | Fedora (32-bit)       |
| RedHat_64     | Red Hat (64-bit)      |
| RedHat        | Red Hat (32-bit)      |
| Linux_64      | Other Linux (64-bit)  |
| Linux         | Other Linux (32-bit)  |

For all ostypes, use `VBoxManage list ostypes` on command line

Inspiration: https://stackoverflow.com/questions/23888381/how-to-run-several-boxes-with-vagrant
