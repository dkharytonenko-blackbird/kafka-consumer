# Kafka Consumer
Add documentation for your project here.

## Table of Contents

* [Overview](#overview)
* [Quick Links](#quick-links)
* [Architecture](#architecture)
* [Tech Stack](#tech-stack)
* [Directory Structure](#directory-structure)
* [Local Setup](#local-setup)
* [Todo](#todo)
* [Metrics](#metrics)

## Overview

Describe your service here.

## Quick Links

|   | Production | Staging |
|---|:----------:|:-------:|
| PrimeRadiant | [kafka_consumer](https://prime-radiant.flippback.com/services/kafka_consumer/services-ecs-prod) | [kafka_consumer-stg](https://prime-radiant.flippback.com/services/kafka_consumer-stg/services-ecs-stg) |
| Datadog Dashboard | `TODO` | `TODO` |

## Architecture

Add links to architecture diagrams here.

### Tech Stack

* Docker & Docker Compose
* Ruby 3.0: [Gem list](Gemfile)
* Rails 6

## Directory Structure

```Text
/.github              # Github Actions Workflow configuration
  /workflow-src       # GHA Workflow configuration translated by gha_config gem
  /workflows          # gha_config execution output from workflow-src/ directory
/app                  # Core application code
  /models             # Virtus models for produced topics
  /schemas            # Avro schemas for produced and consumed messages
/bin                  # Bundle, Rails, and Rake setups
/config               #
  /environments       # Rails environment configuration
  /initializers       # Rails initializers & config
  /settings           # Application settings configuration
/datadog              # Datadog configuration
/deploy               # Deployment scripts
/one-for-all          # One-For-All scripts
/one_click_dev        # Misc convenience scripts e.g. for compiling schemas, publishing to kafka, etc.
/spec                 # RSpec unit tests
```

## Local Setup

First [install RVM](https://rvm.io/rvm/install).

Finally, run `bin/setup` to get your environment set up for development.

You can use `gdc` to manage your app dependencies. For more information on using `gdc`, please see [global_docker_compose](https://github.com/wishabi/global-docker-compose).

## Linting

Ruby `rubocop -a` to fix any auto-fixable offenses which would fail the lint step in build workflow.
You can run `rubocop -A` to fix offenses that may be "unsafe". Most of the time the "unsafe"
part is pretty extreme edge cases, so you can try using `-A` as your default.

## Build Workflow changes

Build Workflow changes go into `.github/workflow-src/CI.yml`.
After the edits, run `gha_config` command in terminal to re-generate `.github/workflows/CI.yml`.

Installation and Usage instructions for gha_config can be found [here](https://github.com/wishabi/gha-config)

## Todo
To get your service up and running you may need to take the following steps:

### Prime Radiant
Change the Tasks / ELB Health Check Endpoint on your service to be `/ping` so
that your service is not thought to be unhealthy and reset repeatedly.

Set a Prime Radiant secret param for SECRET_KEY_BASE. Generate this key using
`rails secret`. See `config/secrets.yml`.

  ### RDS
  Request a RDS database by filing an Eng Cap ticket - and make sure the
  - `DB_PASSWORD` is in Prime Radiant Param Store
  - `DB_HOST` is a set ENV variable in Prime Radiant
  - The service database username is current in `config/database.yml`
  
  If you need to create these users yourself, do the following:
  * [Install the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
  * Use SSM to access gw2:
  
  ```
  aws ssm start-session --target i-04218d
  ```
  
  * Use MySQL to create the user (auto-generate a password using a site like
  [passwordsgenerator.net](https://passwordsgenerator.net/):
  
  ```
  mysql -uadmin -p -h {rds_instance} <%= app_name %>_production
  > create user <%= app_name %>  identified by '{password}';
  > grant all on <%= app_name %>_production to <%= app_name %>;
  ```

## Metrics
