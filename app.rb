require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( './models/cover' )
require_relative( './models/customer' )
require_relative( './models/restaurant' )
require_relative('./controllers/booking_controller')
also_reload( './models/*' )

get '/' do
  erb( :index )
end
