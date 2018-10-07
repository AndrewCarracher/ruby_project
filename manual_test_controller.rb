#concept in work, need to revisit

restaurant1 = Restaurant.new(
  # array of total total_covers
  "total_covers" => 5,
  # hash of opening hours
  "opening_hours" =>
  {
    "open" => "11:00",
    "close" => "22:00"
  }
)

cover1 = restaurant1.create_covers(15)
cover2 = restaurant1.create_covers(20)
cover3 = restaurant1.create_covers(10)
cover4 = restaurant1.create_covers(7)
cover5 = restaurant1.create_covers(8)

cover1.save()
cover2.save()
cover3.save()
cover4.save()
cover5.save()
