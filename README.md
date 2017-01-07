dev_virtual_machine Cookbook
============================

This cookbook configures freshly provisioned hosts from Foreman so they are more user friendly
It configures authorized SSH keys, nfs exports and prompt color

Requirements
------------

user cookbook to get the default user
if there's zsh cookbook used it changes the color schema so it's clear it's a dev box

Usage
-----
#### dev_virtual_machine::default

e.g.
Just include `dev_virtual_machine` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dev_virtual_machine]"
  ]
}
```

