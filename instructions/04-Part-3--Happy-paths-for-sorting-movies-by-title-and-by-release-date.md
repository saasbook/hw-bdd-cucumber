# Part 3: Happy paths for sorting movies by title and by release date

1. Since the scenarios in `sort_movie_list.feature` involve sorting, you will need the ability to have steps that test whether one movie appears before another in the output listing. Create a step definition that matches a step such as
`Then I should see "Aladdin" before "Amelie"`

    **📌 HINTS**

    * `page` is the Capybara method that returns an object representing the page returned by the app server.  You can use it in expectations such as `expect(page).to have_content('Hello World')`.  More importantly, you can search the page for specific elements matching CSS selectors or XPath expressions; see the [Capybara documentation](https://github.com/teamcapybara/capybara) under **Querying**.
    * `page.body` is the page's HTML body as one giant string.
    * A regular expression could capture whether one string appears before another in a larger string, though that's not the only possible strategy.

2. Use the step definition you create above to complete the scenarios `sort movies alphabetically` and `sort movies in increasing order of release date` in `sort_movie_list.feature`.

**SUCCESS** is all steps of all scenarios in both feature files passing Green.

## Committing to GitHub

There's no need to deploy this CHIPS to Heroku, but please do make a commit and push it to your private GitHub repository with your final code.

---

[← Part 2: Happy paths for filtering movies](03-Part-2--Happy-paths-for-filtering-movies.md) | [Contents](README.md) | [Submission →](05-Submission.md)
