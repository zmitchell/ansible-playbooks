# Ansible Playbooks

These are my personal Ansible playbooks. Right now I only use them for setting up a new development environment.

## About

I have a desktop running Antergos (which is basically just Arch Linux). The `init_dev_env.yml` playbook will install a handful of system packages(`ripgrep`, `ethtool`, etc) and a handful of Python packages (`poetry`, `pipenv`, etc).

A few directories are also created to store my projects and things like that. In the near future I'll be extending this playbook to work for macOS and Raspbian (Debian).

## License

Licensed under either of

 * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
 * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in the work by you, as defined in the Apache-2.0
license, shall be dual licensed as above, without any additional terms or
conditions.
