require_relative('../models/cover')
require_relative('../models/customer')
require_relative('../models/restaurant')
require_relative('../models/booking')


Restaurant.delete()
Cover.delete()

pizza_palace = Restaurant.new({
  "name" => "The Pizza Palace",
  "open" => "11:00",
  "close" => "21:00"
  })

pizza_palace.save()

chicken_shack = Restaurant.new({
  "name" => "The Chicken Shack",
  "open" => "11:00",
  "close" => "21:00"
  })

chicken_shack.save()

burger_bar = Restaurant.new({
  "name" => "The Burger Bar",
  "open" => "11:00",
  "close" => "21:00"
  })

burger_bar.save()
