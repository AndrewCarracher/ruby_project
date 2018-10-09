require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( './models/cover' )
require_relative( './models/customer' )
require_relative( './models/restaurant' )
require_relative('./contro')
also_reload( './models/*' )

get '/' do
  erb( :index )
end

get '/new' do
  erb( :new )
end

get '/see' do
  @customer = Customer.all()
  erb( :show )
end

post '/new' do
  @customer = Customer.new( params )
  @customer.save()
  erb( :create )
end

get '/:id/edit' do
  @customer = Customer.find( params [:id] )
  erb( :edit )
end

post ':id' do
  Customer.new( params ).update
  redirect to "/"
end

post '/:id/delete' do
  booking = Customer.find( params[:id] )
  booking.delete()
  redirect to '/'
end

get '/:id' do
  @customer = Customer.find( params[:id] )
  erb( :show )
end
