#concept in work, need to revisit

cover1 = Cover.new({
  "space_available" => 15,
  "time" => {
    "11:00" => true,
    "12:00" => true,
    "13:00" => true,
    "14:00" => true,
    "15:00" => true,
    "16:00" => true,
    "17:00" => true,
    "18:00" => true,
    "19:00" => true,
    "20:00" => true,
    "21:00" => true,
    "22:00" => true,
  }
  })

cover2 = Cover.new({
  "space_available" => 15,
  "time" => {
    "11:00" => true,
    "12:00" => true,
    "13:00" => true,
    "14:00" => true,
    "15:00" => true,
    "16:00" => true,
    "17:00" => true,
    "18:00" => true,
    "19:00" => true,
    "20:00" => true,
    "21:00" => true,
    "22:00" => true,
  }
  })

cover3 = Cover.new({
  "space_available" => 15,
  "time" => {
  }
  })




restaurant1 = Restaurant.new(
  # array of total total_covers
  "total_covers" => [cover1, cover2, cover3]
  # hash of opening hours
  "opening_hours" =>
  {
    "open" => "11:00",
    "close" => "22:00"
  }
)
