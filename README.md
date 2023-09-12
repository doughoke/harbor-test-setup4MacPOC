# archiving - just use the helm chart https://github.com/goharbor/harbor-helm on a local kubs of your choice.

# harbor-test-setup4MacPOC
Creates a POC version of vmWare Harbor on Mac

## Purpose
Easily spin up harbor with clair installed (sorry no notary) on a Mac

## Prereq
- Python 2.7
- Docker and Docker-Compose (Tested on edge 18.04-ce and 1.21 respectively)
- Internet access
- Nothing running on 80,443 and 4443

## How To
Simply clone the repo https://github.com/doughoke/harbor-test-setup4MacPOC.git

```sh
git clone https://github.com/doughoke/harbor-test-setup4MacPOC.git
./installAndConfigureHarbor_POC_onMac.sh
```

### Notes
- Don't fret when you see "WARNING: no logs are available with the 'syslog' log driver" in you terminal
THERE IS NOTHING WRONG!!! vmware team made a logging server that listens to your logs

- Look for logs in dev/var/log/harbor
- access http://localhost/harbor from cloned location
- I like to use tail -f * and watch all the logs fly by when debugging

### Login with

|  | value |
| ------ | ------ |
| user |  admin |
| passowrd  |  Harbor12345 |

### To Test
Login to the repository docker login <yourmachinename>
docker tag SOURCE_IMAGE[:TAG] <yourmachinename>/library/IMAGE[:TAG]
docker push <yourmachinename>/library/IMAGE[:TAG]

- Look at https://github.com/goharbor/harbor/blob/master/docs/user_guide.md for help on understanding Harbor

### When You Are DONE
Simply clean up

docker-compose -f ./harbor/docker-compose.clair.yml -f ./harbor/docker-compose.yml down

or call ./cleanUpHarbor_POC_onMac.sh


## TO-DO
create a test project automatically with clair enabled and pull sample images (some good and some bad) to prove clair integrations with harbor.
create a script to shut down harbor and clean up all directories.
