require_relative('../models/cover')
require_relative('../models/customer')
require_relative('../models/restaurant')
require_relative('../models/booking')
require('pry')


Restaurant.delete()
Cover.delete()
Customer.delete()
Booking.delete()


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

cover1 = Cover.new({"restaurants_id" => pizza_palace.id, "size" => 7})
cover2 = Cover.new({"restaurants_id" => pizza_palace.id, "size" => 9})
cover3 = Cover.new({"restaurants_id" => pizza_palace.id, "size" => 8})

cover4 = Cover.new({"restaurants_id" => chicken_shack.id, "size" => 7})
cover5 = Cover.new({"restaurants_id" => chicken_shack.id, "size" => 9})
cover6 = Cover.new({"restaurants_id" => chicken_shack.id, "size" => 8})

cover7 = Cover.new({"restaurants_id" => burger_bar.id, "size" => 7})
cover8 = Cover.new({"restaurants_id" => burger_bar.id, "size" => 9})
cover9 = Cover.new({"restaurants_id" => burger_bar.id, "size" => 8})

cover1.save()
cover2.save()
cover3.save()
cover4.save()
cover5.save()
cover6.save()
cover7.save()
cover8.save()
cover9.save()

# binding.pry
# nil
