# CHIP 7.7: Behavior Driven Development with Cucumber

## Introduction
In this assignment, you will create user stories to describe a feature of a SaaS app, use the 
[Cucumber][cuke] tool to turn those stories into executable acceptance tests, and run the tests against your SaaS app.

[cuke]: https://cucumber.io/docs/guides/10-minute-tutorial/

Specifically, you will write Cucumber scenarios that test the happy paths of parts 1-3 of the 
[Rails Intro assignment](https://github.com/NYU-CSE-Software-Engineering/hw-rails-intro), in which you added 
filtering and sorting to RottenPotatoes' `index` view for Movies. (Remember, the _happy paths_ are the steps users 
take when they successfully use an application.)

The app code in `rottenpotatoes` contains a "canonical" solution to the Rails Intro assignment against which to write 
your scenarios, and the necessary scaffolding for the first couple of scenarios.

## Get the assignment code

As in previous CHIPS, you will need to authenticate `git` with GitHub to copy our template repo for this assignment
to your personal GitHub account. Once copied, clone your repo to your local machine in order to complete this 
assignment.

> [!NOTE]
> Your directory must be named `rottenpotatoes`.

## Set Up Your Working Environment

Now that you've got the code, you should confirm that you can get RottenPotatoes up and running as we have 
delivered it. These are the same set of steps we take on most new Rails applications.

```sh
cd rottenpotatoes
docker built -t rottenpotatoes:latest .
docker run -it -v "$(pwd):/app" -p 3000:3000 rottenpotatoes"
bundle install
bundle exec rails db:setup # shorthand for db:create, db:migrate, db:seed
bundle exec rails server -b 0.0.0.0 -p 3000
```

## Parts
- [Part 1 - BDD Introduction](Part-1.md)
- [Part 2 - Filtering Movies](Part-2.md)
- [Part 3 - Sorting Movies](Part-3.md)
