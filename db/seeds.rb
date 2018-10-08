require_relative('../models/cover')
require_relative('../models/customer')
require_relative('../models/restaurant')
require_relative('../models/booking')


Restaurant.delete()
Cover.delete()

cover1 = Cover.new({
  "size" => 10
  })
cover2 = Cover.new({
  "size" => 8
  })
cover3 = Cover.new({
  "size" => 6
  })
cover4 = Cover.new({
  "size" => 7
  })
cover5 = Cover.new({
  "size" => 8
  })
cover6 = Cover.new({
  "size" => 5
  })
cover7 = Cover.new({
  "size" => 4
  })
cover8 = Cover.new({
  "size" => 8
  })
cover9 = Cover.new({
  "size" => 12
  })

  cover1.save()
  cover2.save()
  cover3.save()
  cover4.save()
  cover5.save()
  cover6.save()
  cover7.save()
  cover8.save()
  cover9.save()

chicken_shack = Restaurant.new({
  "name" => "The Chicken Shack",
  "opening_hours" => {
      "open" => "11:00",
      "close" => "22:00"
  },
  "cover_slots" => {
    "11:00" => [cover1, cover2 ,cover3],
    "13:00" => [cover1, cover2 ,cover3],
    "15:00" => [cover1, cover2 ,cover3],
    "17:00" => [cover1, cover2 ,cover3],
    "19:00" => [cover1, cover2 ,cover3],
    "21:00" => [cover1, cover2 ,cover3]
  }
})

chicken_shack.save()

# pizza_palace = Restaurant.new({
#   "opening_hours" => {
#       "open" => "11:00",
#       "close" => "22:00"
#   },
#   "cover_slots" => {
#     "11:00" => [cover4, cover5 ,cover6],
#     "13:00" => [cover4, cover5 ,cover6],
#     "15:00" => [cover4, cover5 ,cover6],
#     "17:00" => [cover4, cover5 ,cover6],
#     "19:00" => [cover4, cover5 ,cover6],
#     "21:00" => [cover4, cover5 ,cover6]
#   }
#   })
#
# pizza_palace.save()
#
# burger_bar = Restaurant.new({  "opening_hours" => {
#       "open" => "11:00",
#       "close" => "22:00"
#   },
#   "cover_slots" => {
#     "11:00" => [cover7, cover8 ,cover9],
#     "13:00" => [cover7, cover8 ,cover9],
#     "15:00" => [cover7, cover8 ,cover9],
#     "17:00" => [cover7, cover8 ,cover9],
#     "19:00" => [cover7, cover8 ,cover9],
#     "21:00" => [[cover7, cover8 ,cover9]
#   }
#   })
#
# burger_bar.save()
