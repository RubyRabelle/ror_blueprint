# CONTROLLER
# app/controllers/people_controller.rb


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

# route to get index of all people
get '/people' do
	@people = Person.all
	erb :"/people/index"
end