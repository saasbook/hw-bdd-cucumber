# BDD and Cucumber

# CHIP 7.7: Behavior Driven Development with Cucumber

In this assignment, you will create user stories to describe a feature of a SaaS app, use the [Cucumber][cuke] tool to turn those stories into executable acceptance tests, and run the tests against your SaaS app.

[cuke]: https://cucumber.io/docs/guides/10-minute-tutorial/

Specifically, you will write Cucumber scenarios that test the happy paths of parts 1-3 of the Rails Intro assignment, in which you added filtering and sorting to RottenPotatoes' `index` view for Movies. (Remember, the _happy paths_ are the steps users take when they successfully use an application.)

The app code in `rottenpotatoes` contains a "canonical" solution to the Rails Intro assignment against which to write your scenarios, and the necessary scaffolding for the first couple of scenarios.

## Get the assignment code

As in previous CHIPS, you will need to authenticate `git` with GitHub to clone the repository for this assignment. The clone URL below will require that you use [public key authentication](https://docs.codio.com/common/settings/github.html).

**If your course has provided you with a repository, please clone that:**

```sh
git clone git@github.com:[YOUR_CLASS_GITHUB]/[YOUR_PERSONAL_REPO].git rottenpotatoes
cd rottenpotatoes
```

Otherwise, you may choose to fork, and then close the public template.

```sh
git clone git@github.com:saasbook/hw-bdd-cucumber.git rottenpotatoes
cd rottenpotatoes
```

**⚠️ Your directory must be named `rottenpotatoes`.**


## Setup Your Working Environment

Now that you've got the code, you should get RottenPotatoes up and running. These are the same set of steps we take on most new Rails applications.

```sh
cd rottenpotatoes
bundle config set without 'production'
bundle install
bundle exec rails db:setup # shorthand for db:create, db:migrate, db:seed
bundle exec rails server -b 0.0.0.0
```

Verify that you can load RottenPotatoes with your Codio URL and that it has some movies in the database.

---

[Contents](README.md) | [Part 1: Create a declarative scenario step for adding movies →](02-Part-1--Create-a-declarative-scenario-step-for-adding-movies.md)
