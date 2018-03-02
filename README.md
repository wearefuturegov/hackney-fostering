[![Build Status](http://img.shields.io/circleci/project/github/wearefuturegov/hackney-fostering.svg?style=flat-square)](https://circleci.com/gh/wearefuturegov/hackney-fostering)
[![Coverage Status](http://img.shields.io/coveralls/wearefuturegov/hackney-fostering.svg?style=flat-square)](https://coveralls.io/r/wearefuturegov/hackney-fostering)

# Hackney Fostering

An MVP carried out in conjunction with the London Borough of Hackney's Fostering
Team and FutureGov to make checking eligibility for, and applying to be, a foster carer.

# Development

## Prerequisites

* PostgreSQL
* Ruby 2.4+

## Setup

### Clone the repo

```
git clone https://github.com/wearefuturegov/hackney-fostering.git
```

### Install dependencies

```
bundle install
```

### Setup database

```
bundle exec db:create && bundle exec db:migrate
```

### Run server

```
bundle exec rails s
```

The server is now running at http://localhost:3000
