# harbor-test-setup4MacPOC
Creates a POC version of vmWare Harbor on Mac

## Purpose
Easily spin up harbor with clair installed (sorry no notary) on a Mac

##Prereq
Python 2.7
Docker and Docker-Compose (Tested on edge 18.04-ce and 1.21 respectively)
Internet access
Nothing running on 80,443 and 4443

##How To
Simply clone the repo https://github.com/doughoke/harbor-test-setup4MacPOC.git

git clone https://github.com/doughoke/harbor-test-setup4MacPOC.git

./installAndConfigureHarbor_POC_onMac.sh

###Note
Don't fret when you see "WARNING: no logs are available with the 'syslog' log driver"

THERE IS NOTHING WRONG vmware team made a logging server that listens to your logs

Look for logs in dev/var/log/harbor

access http://localhost/harbor

login with

user:   admin
pwd:    Harbor12345
