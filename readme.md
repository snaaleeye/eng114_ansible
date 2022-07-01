
## What is IaC?

Infrastructure as code is the process of managing and provisioning computer data centers through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools.

or in simple terms

Infrastructure as code (IaC) means to manage your IT infrastructure using configuration files.

## Why should we use Iac? Benefits?

- Cost reduction
- Scalability and availability
- Monitoring and performance visibility
- Consistency 

## What tools are available

- Chef
- Puppet
- Red Hat Ansible Automation Platform
- Saltstack
- Terraform 
- AWS CloudFormation

## What is configuration management and orchestration under IaC

- Configuration Management

Config Management is part of provisioning. Basically, that’s using a tool like Chef, Puppet or Ansible to configure our server. “Provisioning” often implies it’s the first time we do it. Config management usually happens repeatedly.

Configuration management (CM) is a systems engineering process for establishing and maintaining consistency of a product’s performance, functional, and physical attributes with its requirements, design, and operational information throughout its life Configuration management is all about bringing consistency in the infrastructure.

- Orchestration

 Orchestration means arranging or coordinating multiple systems. It’s also used to mean “running the same tasks on a bunch of servers at once, but not necessarily all of them.”

- Configuration Orchestration vs Configuration Management

The first thing that should be clarified is the difference between “configuration orchestration” and “configuration management” tools, both of which are considered IaC tools and are included on this list.

Configuration orchestration tools, which include Terraform and AWS CloudFormation, are designed to automate the deployment of servers and other infrastructure. Configuration management tools like Chef, Puppet, and the others on this list help configure the software and systems on this infrastructure that has already been provisioned.

## What is Ansible?

Ansible is an IT automation tool. It can configure systems, deploy software, and orchestrate more advanced IT tasks such as continuous deployments or zero downtime rolling updates. Ansible’s goals are foremost those of simplicity and maximum ease of use.

## What are the key benefits of Ansible?

- Agentless
- YAML - Python - English-like
- Modular
- Efficient
- Features
- Secure and Consistent
- Reliable
- Performance
- Low overhead
- Ease of use


## How does IaC - Ansible - Terraform fit into DevOps

What is Terraform?

Terraform is ideal for creating, managing, and improving infrastructure. It involves an open-source code responsible for pushing APIs into configuration files. Terraform appears to be a strong contender in the battle of Terraform Vs. Ansible due to some unique advantages.

![1595226778983](https://user-images.githubusercontent.com/105854053/175003549-56a851d5-6145-4de3-a541-afd14995054c.jpeg)


Ansible DevOps

- The feedback loop is accelerated at a faster rate

- The bugs are found sooner and not wait till the end

- Risk due to lack of sufficient knowledge is mitigated

- The deployments are reliable

- The IT infrastructure is coordinated

- The deployments are faster
Need for automation

- Version control and configuration management

- Orchestration of the IT Infrastructure.

When debating between Terraform vs Ansible, Terraform receives support from Red Hat. It’s administered as a tool on AWS for orchestration and includes Packer for addressing the automation tasks. Terraform as an infrastructure provisioning tool communicates with VMware, AWS, GCP, and ensures infrastructure deployment.


## How does it benefit the business?

- Cost reduction
- Scalability and availability
- Monitoring and performance visibility
- Consistency 

https://cloudify.co/blog/ansible-vs-terraform/

https://www.linkedin.com/pulse/understanding-terms-infrastructure-code-management-ansible-sangode

## Pull Config or Push Config - Which is more suitable for pull and push?

Pull Model - Nodes are dynamically updated with the configurations that are present in the server.

Push Model - Centralised server pushes the configuration on the nodes.

## How to ssh into different VMs inside a VM

1. Make sure ip used in vagrantfile is compatible with macOS

2. Inside directory with vagrantfile
`Vagrant up`

3. `Vagrant ssh controller`

4. Inside VM controller
ssh vagrant@IP in vagrantfile
e.g. `ssh vagrant@192.xxx.xx.xx`

5. `exit` second VM leads you back to controller VM

6. Once you are able to ssh into different VMs from within controller Install ansible using these commdands

`sudo apt-get install software-properties-common`

`sudo apt-add-repository ppa:ansible/ansible`

`sudo apt-get install ansible -y`

`sudo apt-get update -y`

7. repeat step 4 and 5 with different ip for different VMs and also install ansible for all. 

8. Navigate to `/etc/ansible`

<img width="457" alt="Screenshot 2022-06-22 at 13 52 23" src="https://user-images.githubusercontent.com/105854053/175033491-8b3d6f1c-7a07-454e-a179-7b033c7b5212.png">

In the hosts file in ansible we can create autoscaling groups

Edit host file with the below information

<img width="618" alt="Screenshot 2022-06-22 at 12 28 18" src="https://user-images.githubusercontent.com/105854053/175018547-c9901be1-f645-4356-93f1-7c6d66feef58.png">

9. After editing the hosts file, enter this command
`ansible web -m ping` for single VM
`ansible all -m ping` - for all

<img width="420" alt="Screenshot 2022-06-22 at 13 39 53" src="https://user-images.githubusercontent.com/105854053/175031122-d4056717-c1ac-49ea-8921-3e17c9b2778c.png">

This message means that you have successfully pinged web.
 
10. Repeat steps 6 and 7 for different IPs using different VMs such as db in place of web

To search other VMs inside the controller vm use this command:
`uname -a`
`ansible web -a "uname -a"`
`ansible web -a "date"`
`ansible web -a "free"`
`ansible web -a "ls -a"` 

Ad-hoc commands
`ansible <group> -m copy -a “src=home/ansible dest=/tmo/home”`

https://intellipaat.com/blog/tutorial/devops-tutorial/ansible-basic-cheat-sheet/

# YMAL
YAML = Yet Another Markup Language

Why YMAL:
- Used with Ansible - Docker - compose - Kubernetes - Cloud formation etc. 
- YAML to create PLAYBOOKS

Steps to create YAML playbook
1. Navigate to `/etc/ansible`
2. `sudo nano nginx-playbook.yml`

<img width="430" alt="Screenshot 2022-06-22 at 14 55 03" src="https://user-images.githubusercontent.com/105854053/175046720-dcb10b33-b7a6-412b-973b-b26463c5b58b.png">

3. To run playbook use this command
`ansible-playbook nginx-playbook.yml`

<img width="732" alt="Screenshot 2022-06-22 at 14 55 28" src="https://user-images.githubusercontent.com/105854053/175046834-e8af2902-3249-4acb-9f5a-d42bac2520cf.png">

4. If you have issues with syntax, run these commands
`ansible-playbook nginx-playbook.yml --syntax-check`

This should be the outcome if all the steps were followed. 
![nginx-welcome-page](https://user-images.githubusercontent.com/105854053/175096869-70b2e368-620e-46c8-985e-1238b35aab4e.png)

## Create a yaml playbook to run app + reverse proxy

1. Navigate to `ect/ansible` and create a new playbook. 

<img width="469" alt="Screenshot 2022-06-22 at 18 10 08" src="https://user-images.githubusercontent.com/105854053/175097123-80c653b8-88b0-4cbc-82c1-2faafccf97d1.png">

2. Run this command `ansible-playbook install_app.yml`

<img width="1033" alt="Screenshot 2022-06-22 at 18 12 20" src="https://user-images.githubusercontent.com/105854053/175097513-ff43776f-0cc5-44d1-835a-721ef7f2eb8e.png">

3. Input the private ip and it should show the app running correctly.  
<img width="711" alt="Screenshot 2022-06-22 at 18 13 01" src="https://user-images.githubusercontent.com/105854053/175097636-3cb1d935-7869-4cc9-a18a-2d802a54db1b.png">

## How to install MongoDB

1. Navigate to `etc/ansible` and create a playbook

<img width="479" alt="Screenshot 2022-06-23 at 14 25 36" src="https://user-images.githubusercontent.com/105854053/175309870-4bbbc387-9d91-4650-8a52-027460c231e5.png">

2. Use this command `ansible-playbook install_db.yml`

<img width="711" alt="Screenshot 2022-06-23 at 14 28 13" src="https://user-images.githubusercontent.com/105854053/175310382-269b6a8d-275a-4e3d-9a87-9e21866a310d.png">

3. Edit web app playbook to include the db ip env variable

<img width="868" alt="Screenshot 2022-06-23 at 15 55 37" src="https://user-images.githubusercontent.com/105854053/175329587-d1cd7ebc-8111-4879-af3d-5d213df54a66.png">

4. Use this command `ansible-playbook install_app.yml`

<img width="772" alt="Screenshot 2022-06-23 at 15 54 54" src="https://user-images.githubusercontent.com/105854053/175329420-5bc93f24-65be-40c0-ae18-754d50189064.png">


5. ssh into vagrant web and npm start -d

6. Enter the ip and this should come up
<img width="953" alt="Screenshot 2022-06-23 at 14 28 46" src="https://user-images.githubusercontent.com/105854053/175310551-62f3063c-e850-4e60-9ee3-5f4481a90480.png">


## Task

- Controller is working
- Create a server on AWS using Ansible controller with PLAYBOOK/S
- AWS access & secrey keys - awscii - s3
- Ansible VAULT
- copy the key/file to  ~/.ssh folder - file.pem - eng114.pem
- create an ssh connection from controller to AWS ec2 - 
- generate a new ssh key pair in the controller - eng114 - eng114.pub 
- To test this you ssh into your ec2 from ansible controller other option is ping - both confirm response
3
- EC2 public ip inside host file 2:04 - 11:00
- `sudo ansible aws -m ping --ask-vault-pass` This is setting up two factor authentication to confirm connection with EC2 
- playbook that can launch ec2 

copy ssh link on aws and paste it inside vagrant@controller with sudo command

inside controller I need
eng114
eng114.pem
eng114.pub
known_hosts

cd /etc/ansible/group_vars/all
sudo nano pass.yml
sudo ansible-vault create pass.yml

aws_access_key:

aws_secret_key:

cat pass.yml

## Task to launch ec2 using ansible

Step 1: 


Install dependencies 
```
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
sudo apt-get install tree

```

Install python

```

sudo apt install python
sudo apt install python-pip -y
sudo pip install --upgrade pip
sudo pip install boto
sudo pip install botocore
sudo pip install boto3

```

Step 2: Use standard settings

SSH into controller

Edit `cd /etc/ansible/hosts`



Step 3:

a) Create directory /etc/ansible/group_vars/all

b) Sudo ansible-vault create pass.yml
    - i to go to insert mode

aws_access_key: <ACCESS KEY>

aws_secret_key: <SECRET KEY>

- esc, :wq!

c) sudo cat pass.yml

d) sudo chmod 666 pass.yml

step 3: 

a) cd ~/.ssh

b)sudo nano eng114.pem
- past eng114.pem key content from localhost

c) sudo chmod 400 eng114.pem

d) ssh-keygen -t rsa -b 2048 

Step 4: Create ansible playbook launch_ec2.yml

Step 5: `ansible-playbook playbook.yml --ask-vault-pass`

Step 6: `ansible-playbook playbook.yml --ask-vault-pass --tags create_ec2`

Step 7: Get public DNS

Step 8: ssh into EC2 instance
 

 
## Migrating Ansible Controller to Cloud

![Untitled (2)](https://user-images.githubusercontent.com/105854053/175952763-e6788651-99c9-49a6-af1c-c755deb4b0b0.jpg)

Step 1: Run these commands on AWS Controller
 
```
 
#!/bin/bash

# update and upgrade
sudo apt update -y && sudo apt upgrade -y
sudo apt-get update -y

#install ansible	
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

#install python and boto3
sudo apt install python
sudo apt install python-pip -y
sudo pip install --upgrade pip
sudo pip install boto
sudo pip install boto3
 
```
Step 2: Navigate to /etc/ansible/ and Create folders group_vars/all and cd group_vars/all and add your aws keys in the vault -> sudo ansible-vault create pass.yml

Step 3: Navigate to cd /etc/ansible and create playbooks 
 - Playbook to launch app node instance
 - Playbook to launch database node instance
 - Ping app and db to check the connection works. 
 - Playbook to cp existing playbooks used.
 
Step 4: Repeat the same steps you did locally and you should have the app and db running on cloud.

errors
fatal: [localhost]: FAILED! => {"changed": false, "msg": "Instances with id(s) ['i-0c2154f122e72388c'] were created previously but have since been terminated - use a (possibly different) 'instanceid' parameter"}
you need to change the instant name in the hosts file as this causes a conflict.  

Invalid public key errors 
 - ensure you have your pem file saved in the right places
 - ensure your new instances have the correct security group permissions on AWS. 
 - make sure the chmod permissions are correct.
 - make sure the key still works.
 
 <img width="718" alt="Screenshot 2022-06-30 at 09 43 37" src="https://user-images.githubusercontent.com/105854053/176633871-a8d5db4c-be0d-410c-94fd-83713b9f09e0.png">

 
## Ansible Server Drift 

Configuration Drift/Server Drift is the phenomenon where running servers in an infrastructure become more and more different as time goes on, due to manual ad-hoc changes and updates, and general entropy.
 
There are two main methods to combat configuration drift. One is to use automated configuration tools such as Puppet or Chef, and run them frequently and repeatedly to keep machines in line. The other is to rebuild machine instances frequently, so that they don’t have much time to drift from the baseline.

The challenge with automated configuration tools is that they only manage a subset of a machine’s state. Writing and maintaining manifests/recipes/scripts is time consuming, so most teams tend to focus their efforts on automating the most important areas of the system, leaving fairly large gaps.

There are diminishing returns for trying to close these gaps, where you end up spending inordinate amounts of effort to nail down parts of the system that don’t change very often, and don’t matter very much day to day.

On the other hand, if you rebuild machines frequently enough, you don’t need to worry about running configuration updates after provisioning happens. However, this may increase the burden of fairly trivial changes, such as tweaking a web server configuration.

In practice, most infrastructures are probably best off using a combination of these methods. Use automated configuration, continuously updated, for the areas of machine configuration where it gives the most benefit, and also ensure that machines are rebuilt frequently.

The frequency of rebuilds will vary depending on the nature of the services provided and the infrastructure implementation, and may even vary for different types of machines. For example, machines that provide network services such as DNS may be rebuilt weekly, while those which handle batch processing tasks may be rebuilt on demand.
 
 https://dzone.com/articles/configuration-drift

## App node Tests 
 
 ```
 
 ---
- name: tests
  hosts: app
  become: yes
  gather_facts: yes #gather machine facts and puts it in a variable called ansible_facts
  tasks:
    - name: store date output for timezone check
      command: date
      register: tstamp

    - name: Timezone # Checks timezone
      debug:
        msg: "Machine timezone is {{ ansible_date_time.tz }}"

    - name: OS #Checks OS  # Checks OS
      debug:
        msg: "OS of machine is {{ ansible_os_family }}"
        
    - name: "Grab all the packages in machine" # Test Name 
      package_facts:
        manager: "auto" # Grabs all the packages in that machine
        
    - name: "Check if NGINX is installed" # Test name
      package_facts:
        manager: "auto"

    - name: confirm nginx is installed # Test name
      assert:
        that: "'nginx' in ansible_facts.packages"

    - name: update if debian # Test to update debian if the OS is debian
      ansible.builtin.command: apt update -y
      when: ansible_facts['os_family'] == "Debian"


    - name: update if Centos # Test to Update CentOS if the OS is CentOS
      ansible.builtin.command: yum check-update
      when: ansible_facts['os_family'] == "Centos"

    - name: Check if port 80 is listening
      shell: lsof -i -P -n | grep LISTEN
      register: port_check_80

    - name: confirm port 80 is listening
      assert:
        that: "'*:80 (LISTEN)' in port_check_80.stdout"

   - name: Check if port 3000 is listening
      shell: lsof -i -P -n | grep LISTEN
      register: port_check_3000

    - name: confirm port 3000 is listening
      assert:
        that: "'*:3000 (LISTEN)' in port_check_3000.stdout"
 
 ```
 
 ## Database Tests 
 
 ```
 
 ---

- name: Assert DB
  hosts: db
  become: true
  gather_facts: true # This allows us to use the ansible variables
  vars:
    ansible_python_interpreter: /usr/bin/python3
  tasks:

  # This checks if UTC is the same as the machines timezone
  - name: Check timezone
    assert:
      that: "'UTC' in ansible_date_time.tz" # This checks if UTC is the same as the machines timezone
      
  - name: Check OS # Test name
    assert:
      that: "'Ubuntu' in ansible_distribution" # Checks if the machines operating systems is Ubuntu
      
  - name: Check if MongoDB is Installed # Test Name
    package_facts:
      manager: "auto" # Gets all the packages from that machine
      
  - name: Confirm that MongoDB is Installed # Test Name
    assert:
      that: "'mongodb-org' in ansible_facts.packages" # Checks if mongodb is in the machine packages
      
  - name: Check what port are open on machine # Test Name
    shell: lsof -i -P -n | grep LISTEN # This is run in the machine. lsof - lists open files, -i is for ips, -P inhibits the conversion of port numbers to port name for network files, -n inhibits the conversion of network numbers to host names for network files. Checks what ports are open and grabs all the lines that have LISTEN in them.
    register: port_check # Sets this as a variable which I can then use later on.
    
  - name: Check if port 27017 is listening # Test Name
    assert:
      that: "'*:27017 (LISTEN)' in port_check.stdout" # Checks if port 27017 is open
      
  - name: Get service facts # Test name
    service_facts: # Grabs all the services in that machine
  
  - name: Check if mongo is running
    assert:
      that:
        - "'{{ansible_facts.services['mongod.service'].state}}' == 'running'" # Checks if mongod is running if not, fail_msg will run. If it was successful, success_msg will run
      fail_msg: "Mongo is down, please start it or restart"
      success_msg: "No issues, mongo is running as expected"
 
 ```
