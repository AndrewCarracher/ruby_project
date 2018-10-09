require_relative( 'models/restaurant')

p rest = Restaurant.find_by_name("The Chicken Shack").to_s

# rest_array = rest.split(' ')
#
# rest_array.each do |r|
#     p r
#   end
