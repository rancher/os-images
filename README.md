# os-images
Docker Images for RancherOS

## Building

Run `./build.sh`

### Multiple architectures

Currently, "amd64" and "arm" architectures can be built. Ubuntu and Debian consoles don't build on ARM, yet.

So, get an ARM docker host, copy `arm.docker-env.sample` to `arm.docker-env`, edit to your settings, run `./build.sh`

Both "amd64" (no suffix) and "arm" (`_arm` appended to image versions) will be built.

## Contact
For bugs, questions, comments, corrections, suggestions, etc., open an issue in
 [rancher/os](//github.com/rancher/os/issues) with a title starting with `[os-images] `.

Or just [click here](//github.com/rancher/os/issues/new?title=%5Bos-images%5D%20) to create a new issue.
