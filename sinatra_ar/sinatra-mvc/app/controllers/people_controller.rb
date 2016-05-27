# CONTROLLER
# app/controllers/people_controller.rb

#   You will use the index.erb file to show ALL the people
#    You will use show.erb file to show ONE person
#    You will use the new.erb file to create a new person
#    And finally, you will use the edit.erb file to edit a person 





# route to get index of all people
get '/people' do
	@people = Person.all
	erb :"/people/index"
end

# route to handle get request to people/new
# (this route needs to come before '/people/:id')
get '/people/new' do
	@person = Person.new
	erb :"/people/new"
end


#post method to handle sumission
post '/people' do
	#check formatting of birthdate entry, convert if necessary
	if params[:birthdate].include?("-")
		birthdate = params[:birthdate]
	else
		birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
	end	
	person = Person.create(
		first_name: params[:first_name],
		last_name: params[:last_name],
		birthdate: birthdate
		)
	redirect "/people/#{person.id}"
end

#the show route for individual person
get '/people/:id' do

	#use ActiveRecord method to find the person with the id passed in
	@person = Person.find(params[:id])

	#convert birthdate to string for numerology app
	birthdate_string = @person.birthdate.strftime("%m%d%Y")

	#get numerology number
	birth_path_num = Person.get_birth_path_num(birthdate_string)

	#get numerology message
	@message = Person.get_message(birth_path_num)

	#render the people/show page
	erb :"/people/show"
end

get '/people/:id/edit' do
	@person = Person.find(params[:id])
	if @person.birthdate == nil
		@person.birthdate = Date.strptime("01012000", "%m%d%Y")
	end
	erb :"/people/edit"
end

put '/people/:id' do
	person = Person.find(params[:id])
	person.birthdate = params[:birthdate]
	person.first_name = params[:first_name]
	person.last_name = params[:last_name]
	person.save
	redirect "/people/#{person.id}"
end

delete '/people/:id' do
	person = Person.find(params[:id])
	person.destroy
	redirect "/people"
end