# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(:title => movie['title'], :release_date => movie['release_date'], :rating => movie['rating'])
  end
  #assert false, "Unimplmemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #regexp = Regexp.new ".*#{e1}.*#{e2}"
  regexp = Regexp.new "#{e1}"+'[\s|\S]*'+"#{e2}"
  #puts page.body
  #puts regexp
  #puts page.body =~ regexp
  assert page.body =~ regexp
  #assert false, "Unimplmemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_a = rating_list.split(', ')
  if (uncheck)
    #puts "uncheck chosen"
    rating_a.each do |rating|
      uncheck("ratings_"+rating)
    end
    click_button("Refresh")
  else
    rating_a.each do |rating|
      check("ratings_"+rating)
    end
    click_button("Refresh")
  end
  
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

#When /I check (the)? "(.*)" checkbox/ do |temp, checkbox|
#  check("ratings_"+checkbox)
#end

When /^I check "([^"]*)" checkbox$/ do |cbox|
  puts cbox
  check("ratings_"+ cbox)
  #pending # express the regexp above with the code you wish you had
end

When /^I uncheck "([^"]*)" checkbox$/ do |ucbox|
  uncheck("ratings_"+ucbox)
  #pending # express the regexp above with the code you wish you had
end


Then /^I should see all of the movies$/ do
  #puts page.rows.count
  #puts page.body
  nmovies =  page.all("table#movies tr").count - 1 # exclude the first heading row
  #pending # express the regexp above with the code you wish you had
  #puts nmovies
  #puts Movie.count
  assert nmovies == Movie.count
end


#Then /I should see "(.*)" before "(.*)"/ do |string1, string2|
  #puts "Test line"
  #puts Movie.all
  #puts "after printing movie list"
  
  #Given %Q{I am on #{path}}
  
#end
