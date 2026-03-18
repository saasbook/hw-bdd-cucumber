# Part 2 - Filtering Movies

1. Complete the scenario ``restrict to movies with `PG` or `R` ratings`` in `filter_movie_list.feature`. For now, you 
can complete this using just the existing step definitions in `web_steps.rb` to check and uncheck the appropriate 
boxes, submit the form, and check whether the correct movies appear (and just as importantly, movies with unselected
ratings do not appear).

> [!NOTE]
> Before moving on, verify that this scenario passes with `bundle exec cucumber features/filter_movie_list.feature`.

2. Since it's tedious to repeat steps such as `When I check the "PG" checkbox`, `And I check the "R" checkbox`, etc., 
create a step definition to match a step such as: `Given I check the following ratings: G, PG, R`

This single step definition should only check the specified boxes, and leave the other boxes as they were.
You should write this new step definition in `movie_steps.rb`, filling in the empty step definition provided. To 
test the step, feel free to modify the scenario you just completed; this isn't required, though, since you'll also
use this new custom step in the other scenario in `filter_movie_list.feature`.

> [!TIP]
> This step definition can reuse existing steps in `web_steps.rb`, as shown in the example in Section 7.8 in ESaaS.

3. Similarly, since it’s tedious to specify a step for each individual movie we should see, add a step definition to 
match a step such as: "Then I should see the following movies:".

>[!TIP]
> Start from the starter code in `movie_steps.rb`. You can check out a default implementation for “I should see” in 
> `web_steps.rb`, or just reuse the actual steps from `web_steps.rb` as described above.

4. For the scenario `all ratings selected`, it would be tedious to use `And I should see` to name every single movie. 
That would detract from the goal of BDD to convey the behavioral intent of the user story. To fix this, complete the 
step definition that will match steps of the form: `Then I should see all the movies` in `movie_steps.rb`.

> [!TIP]
> Consider counting the number of rows in the HTML table to implement these steps. If you have computed the `rows` 
> variable as the number of table rows, you can use the assertion `expect(rows).to eq value` to fail the test in case 
> the values don't match.

5. Use your new step definitions to complete the scenario `all ratings selected`. SUCCESS is when all scenarios in 
`filter_movie_list.feature` pass with all steps green.

## Next
[Part 3 - Sorting Movies](Part-3.md)