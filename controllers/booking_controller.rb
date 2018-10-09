require_relative( '../models/cover.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/create' do
  @booking = Customer.all()
  erb ( :create )
end

post '/new_booking' do
  @booking = Booking.new(params)
end
