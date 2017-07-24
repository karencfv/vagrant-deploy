# Experimental Vagrant environment

Automated experimental ruby application deployment environment. Will run in conjunction with [hello_app](https://github.com/karencfv/hello_app)

## Requirements
- Vagrant
- VirtualBox

## Installation
run `vagrant up` to build VM and `vagrant ssh` to SSH into it

To deploy by pushing into a github repository SSH keys will need to be generated:
```
$ ssh -T git@github.com
$ ssh-keygen -t rsa
```

Add public key following these [instructions](https://developer.github.com/v3/guides/managing-deploy-keys/).
Add your local SSH Key to your authorized keys file.

## TODO:
- Change provisioning from shell scripts to a proper configuration management tool.
- CircleCI or TravisCI integration for automated testing and aiding CI/CD practices.
- Integrate monitoring and metrics tool such as Grafana.
- Properly configure roles for security
- Automate `bundle` on deployment
- Switch Apache for Ngnix if the app will expect heavy loads and integrate a load testing tool. 

*__Dislaimer:__ This setup does __NOT__ work yet, but feel free to play around with it*
