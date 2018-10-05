require_relative('../models/cover')
require_relative('../models/customer')

Cover.delete()
# Customer.delete()

customer1 = Customer.new({
  "first_name" => "Frank",
  "last_name" => "Smith",
  "email" => "frank@mail.com",
  "phone_number" => "07867425319"
})

customer2 = Customer.new({
  "first_name" => "Anne",
  "last_name" => "Smith",
  "email" => "anne@mail.com",
  "phone_number" => "07853802534"
})
#
customer1.save()
customer2.save()

cover1 = Cover.new({
  "customer_id" => customer1.id
  })

cover2 = Cover.new({
  "customer_id" => customer2.id
  })

  cover1.save()
  cover2.save()
