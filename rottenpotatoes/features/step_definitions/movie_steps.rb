# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    @t = movie["title"]
    @r = movie["rating"]
    @rd = movie["release_date"]

    Movie.create("title":@t, "rating":@r)
  end
  #fail "Unimplemented"
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  found_e1 = false
  found_e2 = false
  e1_b_e2 = nil
  page.all('#movies tbody tr td').each do |td|
    if td.text == e1
      found_e1 = true
      e1_b_e2  = found_e2 ? false : true
    elsif td.text == e2
      found_e2 = true
    end
  end
    
  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  if uncheck
    for r in rating_list.split
      uncheck("ratings["+r+"]")
    end
  else
    for r in rating_list.split
      check("ratings["+r+"]")
    end
  end
  #fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  count = -1
  page.all('tr').each do |tr|
    count +=1
  end
  Movie.count.should be count
  #fail "Unimplemented"
end
