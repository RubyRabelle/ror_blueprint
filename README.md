# ror_blueprint
SkillCrush 204
Lesson 8 - Refactor Numerology app 
CODE SMELLS:
  -duplicate code 
  -long methods
  -classes with more than 12 methods
  -too many parameters passed to a method
  -identifiers that are too long
  *sometimes looking for a problem can cause a problem.
  
Cleaned up code:
  removed methods from index-controller.rb
  Created person class in person.rb
    class Person < ActiveRecord::Base
  
  added methods to person class
    self.get_birth_path_number
    self.get_message

added faker to gemfile  

seed the database with randomly generated fake data to simulate real world production environment

require gem 'faker'
**-------------------------------------------
** NOTES ON WINDOWS
**-------------------------------------------
on windows must use "bundle exec" as prefix to commands like:
rackup (which launches local webserver)
rake

**-------------------------------------------
** rake
**-------------------------------------------
bundle exec rake db:create  -- builds db
bundle exec rake db:migrate -- moves files to database?
bundle exec rake db:seed - populate db with fake instances of person class
bundle exec rake console - creates an irb like console where you can test
  to make sure that your data was created and stored
  people = Person.first
  people = Person.all (to display all instances in db)
  
**seeds.rb
**---------------
require 'faker'
  (1..40).each do |i|
	Person.create(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name, 
		birthdate: Faker::Date.between(80.years.ago, 18.years.ago)
		)
end

