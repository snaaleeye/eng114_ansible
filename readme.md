
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


3. To run playbook use this command
`ansible-playbook nginx-playbook.yml`