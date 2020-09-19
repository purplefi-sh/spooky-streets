# Get Started

## Installation

1. Clone your new repo into your local dev environment & `cd` into the new directory
1. Ensure you have the npm configs set globally for Font Awesome Pro, or that you have a `.npmrc` file with your Font Awesome Pro auth token ([more info](https://fontawesome.com/how-to-use/on-the-web/setup/using-package-managers#installing-pro))
1. Run `bundle install`
1. Run `yarn install`
1. Copy `.env.sample` to `.env` (`cp .env.sample .env`)

## Running the App
1. Run `docker-compose up -d` (`dcup` if you have the aliases below) to spin up Postgres & Redis
1. Run `rails s` to spin up the Rails server
1. Run `./bin/webpack-dev-server` to spin up the Webpack Dev Server
1. Run `bundle exec sidekiq` to spin up Sidekiq if needed

## Helpful Aliases
```shell
alias dcdown='docker-compose down'
alias dcps='docker-compose ps'
alias dcup='docker-compose up -d'
```
