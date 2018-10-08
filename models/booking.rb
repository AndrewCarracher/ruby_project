require_relative('cover')
require_relative('customer')
require_relative('restaurant')

class Booking

  attr_reader :id, :customer_id, :restaurants_id, :covers_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id'].to_i()
    @restaurants_id = options['restaurants_id'].to_i()
    @covers_id = options['covers_id'].to_i()
  end

  def check_availablity(customer)
    customer_details = customer.all(customer_id)
    party_size = customer_details['party_size']
  end

end
