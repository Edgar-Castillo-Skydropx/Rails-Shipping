# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

## COMMANDS

- rails tailwindcss:install
- rails generate devise:install
- rails generate devise user
- rails g tailwind_devise:views
- rails g migration AddUsernameToUsers username:string:uniq

## ENV FILE

```bash
PROJECT_NAME=shipping
PROJECT_PORT=4000
PORT=4000
PROJECT_HOST=localhost
PROJECT_MODE=development

POSTGRES_DB=shipping
POSTGRES_USER=root
POSTGRES_ROL=root
POSTGRES_PASSWORD=root
POSTGRES_HOST=localhost
POSTGRES_PORT=5432

ADMIN_PASSWORD=$123$567$

PGADMIN_DEFAULT_EMAIL=root@root.com
PGADMIN_DEFAULT_PASSWORD=root
PGADMIN_PORT=5050

REDIS_URL=redis://default:root@localhost:6379
REDIS_IS_SECURE=false
REDIS_HOSTNAME=localhost
REDIS_PORT=6379
REDIS_PASSWORD=root
REDIS_COMMANDER_USER=root
REDIS_COMMANDER_PASSWORD=root
REDIS_COMMANDER_PORT=8081
```
