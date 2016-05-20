# Leipzig-Furman Collaboration: virtualMachine2016

A Vagrant virtual machine for running CITE/CTS services with data from the Leipzig-Furman collaboration on Plutarch's *Life of Pericles*. The VM runs Ubuntu-server/trusty, 64-bit version. 

## Requirements

To use this Virtual Machine, you need to install two pieces of software:

- [VirtualBox](https://www.virtualbox.org)
- [Vagrant](https://www.vagrantup.com)

## Running

These instructions assume familarity with the command-line environment on your computer.

- Download and install [VirtualBox](https://www.virtualbox.org) 

- **Test VirtualBox by opening it on your machine.** Some Windows hardware require you manually to enable VT-x in the machine's firmware; see, for example [this page on the issue](http://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/). Every brand of hardware has its own method for doing this, and every inidivual model may be different. 

- Download and install [Vagrant](https://www.vagrantup.com).

- Clone this repository. *E.g.*:

- In a Terminal, navigate into the resulting directoy, `virtalMachine2016`, with, *e.g.* `cd ~/Desktop/virtualMachine2016`.

- Start the virtual machine with the termina command `vagrant up`. The first time you do this, Vagrant will take many minutes downloading files, seting up a Linux virtual machine, and provisioning it. **Do not let your computer go to sleep during this process**. 

## Using the Virtual Machine

- `vagrant up` starts the machine.
- `vagrant ssh` (from the `virtualMachine2016` directory) logs into the machine. `logout` exits the machine.
- Stop the virtual machine with `vagrant halt`.
- You can destroy the virtual machine with `vagrant destroy`. After doing that, you can re-created it with `vagrant up`, at which point it will download and provision a fresh new instance of it.

## Where Things Are

The `virtualMachine2016` directory, where this `README.md` file is, is mapped in the virtual machine to `/vagrant`.

### Contents of `/vagrant`

- `scripts`
- `citemgr`
- `cs2`
- `testcorpus2016`

### Misc. Notes

If you reconfigure the Fuseki DB config (`/cs2/fuseki/config-template.ttl`), you need to do the following:

- Delete the following directories (they will be rebuilt automatically): 
	- `/cts2/fuseki/fusekibase/system`
	- `/cts2/fuseki/fusekibase/system_files`
- Re-run `gradle configure` (from `/cs2/`).
