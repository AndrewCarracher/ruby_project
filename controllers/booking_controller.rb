require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cover.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/restaurant.rb' )
also_reload( '../models/*' )

get '/create' do
  @booking = Customer.all()
  erb ( :"create" )
end
