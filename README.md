[![build status](https://gitlab.scale.sc/sc-puppet/puppet-sc_postgresql/badges/master/build.svg)](https://gitlab.scale.sc/sc-puppet/puppet-sc_postgresql/commits/master)

# sc_postgresql

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with sc_apache](#setup)
    * [What sc_apache affects](#what-sc_postgresql-affects)
    * [Beginning with sc_apache](#beginning-with-sc_postgresql)
4. [Usage - Configuration options and additional functionality](#usage)

## Overview

ScaleCommerce Wrapper Module for puppetlabs-postgresql. Manages Supervisord, Databases, Users, Roles.

## Module Description

This module uses hiera to configure Postgresql ressources.

## Setup

### What sc_postgresql affects

* postgresql
* supervisord

### Beginning with sc_postgresql

You will need a working hiera-Setup (https://docs.puppetlabs.com/hiera/3.1/complete_example.html).

Check out our solultion for Puppet-Hiera-Roles (https://github.com/ScaleCommerce/puppet-hiera-roles).

## Usage: Databases

Put this into your node.yaml or role.yaml. See [Documentation of puppetlabs-postgresql](https://github.com/puppetlabs/puppetlabs-postgresql) for details on postgresql yaml syntax.
```
---
classes:
  - sc_postgresql
```
