### awx-demo

This repo is to demo for awx (Opensource version of ansible tower)

clike [official docs](https://github.com/ansible/awx). for more details around awx

```
├── awx
│   └── docker-compose.yml
└── inventories
    ├── dev
    │   ├── group_vars
    │   │   └── all
    │   │       └── vars.yml
    │   ├── host.yml
    │   └── host_vars
    │       └── localhost.yml
    ├── prod
    │   ├── group_vars
    │   │   └── all
    │   │       └── vars.yml
    │   ├── host.yml
    │   └── host_vars
    │       └── localhost.yml
    └── test
        ├── group_vars
        │   └── all
        │       └── vars.yml
        ├── host.yml
        └── host_vars
            └── localhost.yml

```

The `awx` folder contain a docker compose file to start awx. Pleae note- when the project was compile this is the docker-compose file formed with the respected version. there might be new and improved verson of config, if you install from scratch by following above link would be help.

`inventories` is for just demo.


