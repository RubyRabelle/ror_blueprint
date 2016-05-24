# activerecord-template
active record template downloaded from sk
Fighting with windows every step of the way ... finally got it working!
5/3/2016

1. bundle install
2. bundle exec rake db:create  
	--> error: rake is not part of the bundle add it to the Gem file
3. add rake to gemfile
4. --> createdb too many command-line arguments (first is "postgres")
5. removed changed rakefile to force prompt for password
	system("createdb -W --username=#{DB_USERNAME}  #{DB_NAME} " )
    system("createdb -W --username=#{DB_USERNAME} #{TEST_DB_NAME}")
6. added create_table to xxx_create_people.rb
7. bundle exec rake db:migrate  --> CreatePeople migrated  (!!)
8. person class created in person.rb in the models folder
9. rake console
10.enter person record into console
