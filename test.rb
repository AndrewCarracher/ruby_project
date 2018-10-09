require_relative( 'models/restaurant')
require_relative( 'models/booking')
#
# p rest = Restaurant.find_by_name("The Chicken Shack").to_s

p Booking.check_availablity( "13:00" )

# rest_array = rest.split(' ')
#
# rest_array.each do |r|
#     p r
#   end
