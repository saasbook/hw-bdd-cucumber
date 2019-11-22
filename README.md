BDD and Cucumber
================

**NOTE: Do not clone this repo to your workspace. Fork it first, then clone your fork.**


In this assignment you will create user stories to describe a feature of a 
SaaS app, use the Cucumber tool to turn those stories into executable 
acceptance tests, and run the tests against your SaaS app.  


# Learning Goals

After completing this assignment, you will know how to:

* Write a Cucumber acceptance test, based on a user story, reflecting
the basic test structure of
test setup (Given) followed by stimulus (When) and finally postcondition checking (Then).
* Run the test and identify passing and failing steps.
* Create more complex (declarative) scenario steps by re-using
existing simple (imperative) scenario steps, both to keep your test
code DRY and to allow your Cucumber scenarios to express behavior at a
higher level of abstraction.

# Overview

Specifically, you will write Cucumber scenarios that test the happy
paths of parts 1-3 of the Rails Intro assignment, in which you added
filtering and sorting to RottenPotatoes' `index` view for Movies.

The app code in `rottenpotatoes` contains a "canonical"
(known-correct) solution to the
Rails Intro assignment against which to write your scenarios, and the
necessary scaffolding for the first couple of scenarios. 

Fork this repo to your GitHub account, then clone the fork to your
development environment.

We recommend
that you do a `git commit` as you get each part working.  As an optional
additional help, Git allows you to associate tags---symbolic
names---with particular commits.  For example, immediately after doing a
commit, you could say `git tag hw4-part1b` , and thereafter you could
use `git diff hw4-part1b` to see differences since that commit, rather
than remembering its commit ID.  Note that after creating a tag in your
local repo, you need to say `git push YOUR_REMOTE --tags` to push the tags to
your remote.

# Part 0: Set up

Like other useful tools we've seen, Cucumber is supplied as a Ruby gem,
so the first thing we need to do is declare that our app depends on this
gem and use Bundler to install it.

We actually need some additional gems besides Cucumber itself:
* `cucumber-rails` provides support for Cucumber to work with Rails
apps.
* `cucumber-rails-training-wheels` provides a set of very basic
low-level Cucumber step definitions having to do with inspecting your
SaaS app's Web pages and filling in forms.  We will get away from
using these later, but they are a useful "starter pack" for writing
your first Cucumber scenarios.
* `capybara` does the actual work of manipulating Web pages and
"pretending to be a user".
* `database_cleaner` clears the test database between runs: every
scenario starts with an empty database, so scenarios don't depend on each other
* `launchy` is a useful debugging tool that shows you exactly the web
page Cucumber "sees", in case you're having trouble debugging your
test steps

Ensure the `group :test` section of Gemfile contains (at least) those
gems:

```ruby
group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions  
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
end
```

Then run `bundle install --without production` as usual.

Cucumber and Capybara need some "boilerplate" files to work correctly.
Like Rails, Cucumber comes with a
_generator_ that creates the necessary files for you.  
In the app's root directory,
run the following two commands (if they ask whether it's OK to
overwrite certain files, you can safely say yes): 

```sh
rails generate cucumber:install --capybara
rails generate cucumber_rails_training_wheels:install
```

Running these two generators gives you a few commonly used step definitions
as a starting point, such as interactions with a web browser.
Take a moment to look at these predefined step definitions in 
`rottenpotatoes/features/step_definitions/web_steps.rb`; 
in this assignment you'll need to create new step definitions to match
the unique functionality of your app, and some of your step
definitions may reuse these simpler ones like subroutines.

# Part 1: warm up

Recall that a feature is defined by one or more scenarios.  The
scenarios that make up each feature live in file in the app's
`features/` subdirectory in files with names ending in the extension `.feature`.

We will start with a warm-up exercise.  Read the feature file for
"User can manually add a movie" and observe how the steps mimic what a
human user would do to manually add a new movie to RottenPotatoes.  

Running `rake cucumber` (try it now) will cause Cucumber to try to run
all the features. 
Cucumber will display each step of each scenario as it's run using one
of four colors: Green if the step passed, Red if it failed, Yellow if
there is no step definition that matches the step ("not implemented
yet"), and Blue if the step was skipped.

On this first run, you will get a slew of failures in red,
with some steps shown in blue because a failing step causes all
remaining steps in that scenario to be skipped.

As a warm-up, let's narrow our attention to just one scenario:

`bundle exec cucumber features/add_movie.feature`

(Running `rake cucumber` automatically prepends `bundle exec` and also
ensures the test database's schema is brought up-to-date with any
changes to the main database schema.  You'd use this when it's time to
re-run all your app's scenarios, but when working on a single scenario
at a time, it's usually easier just to run that single scenario.  You
can also provide a specific line number to start at, as in `bundle
exec cucumber features/add_movie.feature:3`, to run only the single
scenario starting at line 3 of the file.)

In this case, the first
step on line 4 is red, so Cucumber skips the rest of the scenario.
As the error message explains, the step fails because
there is no path in `features/support/paths.rb` that matches "the RottenPotatoes home
page."  What does this message mean?

Look in that file and you will see a method called `path_to()`.  Now
look at `web_steps.rb` and find the step definition whose regexp
matches "Given I am on the RottenPotatoes home page", and you 
will see that the body of that step def tries to pass a string to
`path_to`.  It expects `path_to` to return an actual URL, which will
be supplied to `visit`, a method within Cucumber that will try to
request that URL from your app and ingest the result.

Our problem is that we'd like to refer to "the RottenPotatoes home
page" in our steps rather than providing an explicit URL.  Modify the
`path_to()` method so that if passed "the RottenPotatoes home page" it
returns the correct app-relative URL for the home page.

If you now re-run the test, that first step should pass, but the
scenario will still fail later on because you also need a page name to
URL mapping for "the Create New Movie page", so you'll have to add that.

**SUCCESS:** When you re-run the scenario with your fix in place, 
all steps should turn green for Passing,
which gives Cucumber its name.


**Part 1: Create a declarative scenario step for adding movies**

The goal of BDD is to express behavioral tasks rather than low-level operations.  

The background step of all the scenarios in this homework requires that
the movies database contain some movies.  Analogous to the explanation
in Section 4.7, it would go against the goal of BDD to do this by
writing scenarios that spell out every interaction required to add a new
movie, since adding new movies is not what these scenarios are about. 

Recall that the `Given` steps of a user story specify the initial state
of the system: it does not matter how the system got into that state.
For part 1, therefore, you will create a step definition that will match
the step `Given the following movies exist` in the `Background` section
of both `sort_movie_list.feature` and `filter_movie_list.feature`.
(Later in the course, we will show how to DRY out the repeated
`Background` sections in the two feature files.) 

Add your code in the `movie_steps.rb` step definition file.  You can
just use ActiveRecord calls to directly add movies to the database; it`s
OK to bypass the GUI associated with creating new movies, since that's
not what these scenarios are testing. 

SUCCESS is when all Background steps for the scenarios in
`filter_movie_list.feature` and `sort_movie_list.feature` are passing
Green. 

**Part 2: Happy paths for filtering movies**

1. Complete the scenario `restrict to movies with `PG` or `R` ratings` in `filter_movie_list.feature`. You can use existing step definitions in `web_steps.rb` to check and uncheck the appropriate boxes, submit the form, and check whether the correct movies appear (and just as importantly, movies with unselected ratings do not appear).

2. Since it's tedious to repeat steps such as When I check the 'PG' checkbox, And I check the 'R' checkbox, etc., create a step definition to match a step such as:
`Given I check the following ratings: G, PG, R`
This single step definition should only check the specified boxes, and
leave the other boxes as they were. HINT: this step definition can reuse
existing steps in  `web_steps.rb` , as shown in the example in Section
7.9 in ESaaS.

3. For the scenario `all ratings selected`, it would be tedious to use `And I should see` to name every single movie. That would detract from the goal of BDD to convey the behavioral intent of the user story. To fix this, create step definitions that will match steps of the form: 
`Then I should see all of the movies` in `movie_steps.rb`. 
HINT: Consider counting the number of rows in the HTML table to implement these steps. If you have computed rows as the number of table rows, you can use the assertion 
`expect(rows).to eq value`
to fail the test in case the values don't match.
Update: You no longer need to implement the scenario for no ratings selected.

4. Use your new step definitions to complete the scenario `all ratings selected`. SUCCESS is when all scenarios in `filter_movie_list.feature` pass with all steps green.

**Part 3: Happy paths for sorting movies by title and by release date**

1. Since the scenarios in `sort_movie_list.feature` involve sorting, you will need the ability to have steps that test whether one movie appears before another in the output listing. Create a step definition that matches a step such as 
`Then I should see "Aladdin" before "Amelie"`

### HINTS

  * `page` is the Capybara method that returns an object representing
  the page returned by the app server.  You can use it in expectations
  such as `expect(page).to have_content('Hello World')`.  More
  importantly, you can search the page for specific elements matching
  CSS selectors or XPath expressions; see the [Capybara
  documentation](https://github.com/jnicklas/capybara) under **Querying**.
  * `page.body` is the page's HTML body as one giant string.  
  * A regular expression could capture whether one string appears before
  another in a larger string, though that's not the only possible
  strategy. 

2. Use the step definition you create above to complete the scenarios `sort movies alphabetically` and `sort movies in increasing order of release date` in `sort_movie_list.feature`.

**SUCCESS** is all steps of all scenarios in both feature files passing Green.

**Part 4: Add a new feature to RottenPotatoes

So far, you have created tests for app features that already existed.
In true BDD, you would first write the scenarios (user stories), and
to make each line of the scenario pass, you write the necessary app
code.

