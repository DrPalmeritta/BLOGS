# Install k3s

## Description:

Install k3s (without downloading and executing shell code with root permissions)

Playbook is reachable via own [ansible-automation](https://github.com/DrPalmeritta/ansible-automation/blob/main/install-k3s.yml) repository as `install-k3s.yml`

## Dependencies:

If you want to have a specific version of k3s installed, settings `k3s_version` will do that (see the example playbook below).

In case you want to override the default locations, these two variables can be set:

`path_to_install_to`: defaults to `/usr/local/bin`
`systemd_directory_path`: defaults to `/etc/systemd/system`
If you know why you would want that, feel free to use a different URL or channel. Here are the defaults:

`k3s_installation_url`: defaults to https://update.k3s.io/v1-release/channels
`k3s_installation_channel`: defaults to stable
