# [DEPRECATED] This is the old community website for the Belgian ruby user group

This is the repo for the Belgian Ruby UserGroup website ([BRUG](http://brug.be))
Please fork or ask for project access so we can make this even better.

* Ruby version
  * production runs on 1.9.3+
  * Also works on ruby 2

* Configuration

Copy .env.example to .env and fill in all the keys.

* You need to create a twitter application at [http://dev.twitter.com/apps/new](http://dev.twitter.com/apps/new)
* You will also need a meetup api key to fetch all upcoming events. Get yours at https://secure.meetup.com/meetup_api/key/

* Database creation

We used mysql, copy the config/database.yml.example to config/databae.yml, fill in all the required fields en run these defailt rails commands

    rake db:create:all
    rake db:migrate
    rake db:seed

* How to run the test suite

We used minitest, so just run **rake** or **rake test**

* Deployment instructions

Runs on [Openminds](http://openminds.be). Contact us if you would like to be able to deploy. We only need your public ssh key.

[![PullReview
stats](https://www.pullreview.com/github/brug-be/brug/badges/master.svg?)](https://www.pullreview.com/github/brug-be/brug/reviews/master) [![Build Status](https://travis-ci.org/brug-be/brug.svg?branch=master)](https://travis-ci.org/brug-be/brug)
