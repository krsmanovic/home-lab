# Ignition file

Actions list within the `coreos.ign`:
* setting up ssh key for user `core`
* setting up the hostname
* setting up static IP address

`ens192.nmconnection` file is the product of base64 conversion within the `coreos.ign` and will be rendered at the desired path `/etc/NetworkManager/system-connections/ens192.nmconnection`.

File permissions are in **decimal** format, converted from **octal**:
* `420` in the ignition configuration is `0644` in CoreOS file system
* `384` in the ignition configuration is `0600` in CoreOS file system
