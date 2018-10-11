require_relative( '../models/cover.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )
require('pry')

get '/create' do
  erb ( :new )
end

post '/create_booking' do
  availability = Booking.check_availablity( params["time_requested"], params["party_size"], params["restaurant"])

  if availability != false
      customer1 = Customer.new( params )
      customer1.save()
      booking1 = Booking.new({"customers_id" => customer1.id, "covers_id" => availability, "booking_time" => params["time_requested"] })
      booking1.save()
      erb ( :create )
    end

  erb ( :create )
end

######

get '/find' do
  erb ( :search )
end

post '/display_booking' do
  #find booking by customer name
  @customer1 = Customer.find_by_name( params["first_name"], params["last_name"])
  @restaurant_name = params["restaurant"]
  @restaurant1 = Restaurant.find_id_by_name(@restaurant_name)
  @cover_array = Cover.find_by_restaurant_id(@restaurant1)
  #have update link below
  erb ( :search_result )
end

get "/update_booking/:id" do
  erb( :update )
end

post "/updated_booking/:id" do
  booking = Booking.find(params[:id].to_i)
  booking.update(params["time_requested"])
  customer = Customer.all(booking.customers_id)
  customer.update(params["first_name"], params["last_name"], params["email"], params["phone_number"],params["party_size"])
  erb( :updated)
end

post "/delete_booking/:id" do
  #cust then booking
  booking = Booking.find(params[:id].to_i)
  cust_id = booking.customers_id
  booking.delete(booking.id)
  Customer.delete_by_id(cust_id)
  redirect to("/")
end
#########
