[![Build Status](http://img.shields.io/circleci/project/github/wearefuturegov/hackney-fostering.svg?style=flat-square)](https://circleci.com/gh/wearefuturegov/hackney-fostering)
[![Coverage Status](http://img.shields.io/coveralls/wearefuturegov/hackney-fostering.svg?style=flat-square)](https://coveralls.io/r/wearefuturegov/hackney-fostering)
[![License](http://img.shields.io/:license-apache-blue.svg?style=flat-square)](http://www.apache.org/licenses/LICENSE-2.0.html)

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

## Gotchas

This app is built with a gem called [Incredible](https://github.com/wearefuturegov/incredible), which was an attempt to extend [Wicked](https://github.com/schneems/wicked) to allow multi-page forms to be specified in YAML.

As it was a quite rapid prototype, it never quite lived up to its promise, but still works pretty well. The forms are specified in `config/forms/*.yml`, which specifies steps for a form. Each step has some or all of the following attributes:

* `template` - The template to be used for this step. This usually lives in `app/views/applications`
* `next_step` - The step to go to after this step has been completed (this can be overriden (see [rules](#rules)))
* `questions` - Specifies what questions to ask in a step. Questions should have some or all of the following:
  * `name` - The name of the question, usually this will refer to an object in the database, though some 'questions' can just be cosmetic
  * `title` - The title of the question (i.e. How old are you?)
  * `widget` - The widget to use. This usually lives in `app/views/main`
  * Individual questions may have extra attributes, which are used in the widget view

### Rules

After a step is completed, Incredible checks for the existence of a rule, which does some simple logical operation. This usually is something like [checking what step to go to next](https://github.com/wearefuturegov/hackney-fostering/blob/master/app/rules/adults_at_home_rule.rb), depending on what the input was, or may [send the user to another form](https://github.com/wearefuturegov/hackney-fostering/blob/master/app/rules/pets_rule.rb), or [queue a job](https://github.com/wearefuturegov/hackney-fostering/blob/master/app/rules/contact_phone_time_rule.rb).

Rules are stored in (and autoloaded from) the `app/rules` directory, and must be named `STEP_NAME_rule.rb` (where STEP_NAME is the rule name specified in the Yaml). A rule looks like this:

```ruby
class StepNameRule < ApplicationRule
  def process
    # CODE GOES HERE
  end
end
```

Steps must be camel cased to match the filename, as per the usual Rails autoloading convention.
