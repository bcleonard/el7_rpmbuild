# el7-rpm-build

The purpose of this container is to build rpm files based on .spec and sources files.  I found myself having to rebuild some rpms when i migrated from centos6 to centos7. Either they didn't exist or didn't install correctly for some reason.  I didn't want build just a rpmbuild server, so I thought perhaps I could build a container to do the work.  This is the result of that work.

### Note
The contents of this container and the ability to build rpms are specific the specific needs of the rpm's I build.  Out of the box, I suspect
that this container will not work for you.  Feel free to contact me with any questions/concerns you have.

### Preperation
Before running the container, you'll need to have the following directories predefined on the container host:
```sh
BUILD
BUILDROOT
LOGS
RPMS
SOURCES
SPECS
SRPMS

```
You'll notice the LOGS directory is not defined as part of a build host.  I use that to store the logs of the run.   I used
```sh
/data/rpmbuild/BUILD
/data/rpmbuild/LOGS
/data/rpmbuild/RPMS
/data/rpmbuild/SOURCES
/data/rpmbuild/SPECS
/data/rpmbuild/SRPMS
```
for the instructions below.  Just make sure you create it prior to starting the container.

### To start the container (without the test database container):
```sh
docker run -v /data/rpmbuildroot:/root/rpmbuild bcleonard/el7-rpm-build
```

### Output
Assuming everything works, you'll find built RPMS in:
```sh
/data/rpmbuild/RPMS
```

Logs will be found in:
```sh
/data/rpmbuild/LOGS
```
You should be able to determine what went wrong with the build in the log file.

