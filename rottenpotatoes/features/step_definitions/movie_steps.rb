# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  @row_counter = 1 #the first row is the header of the table
  @movies_table = movies_table
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
    @row_counter += 1
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

When /^(?:|I )follow ([^"]*)$/ do |link|
  if link == "Movie Title";
    click_link('title_header')
  elsif link == "Release Date"
    click_link('release_date_header')
  end
end


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  @text = page.body
  # the =~ tells me the starting position of that regular expression in the body, e1 should have a lower number than e2 in the code below!
  ((/#{e1}/ =~ @text) < (/#{e2}/ =~ @text)).should be true
end

################################################################################
################################################################################
################################################################################
When /I check the following ratings: (.*)/ do |rating_list|
  rating_list.split(', ').each do |i|
    
    check("ratings_#{i}")
end
end

And /I uncheck the following ratings: (.*)/ do |rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(', ').each do |i|
    
    uncheck("ratings_#{i}")
  end
end

Then /^(?:|I )press  "([^"]*)"$/ do |button|
  click_button(button)
end

Then(/^I should see "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5|
  @movie_list = [arg1, arg2, arg3, arg4, arg5]
  @movie_list.each do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
end

And(/^I should not see "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5|
  @movie_list_2 = [arg1, arg2, arg3, arg4, arg5]
  @movie_list_2.each do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
end



Then /I should see all of the (.*)/ do |movies|
  (page.all("table tr").count).should be @row_counter
end