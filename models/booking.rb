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

  def save()
    sql = " INSERT INTO bookings
    (
      customer_id, restaurants_id, covers_id
      )
      VALUES
      (
        $1, $2, $3
        )
        RETURNING id"
    values = [@customer_id, @restaurants_id, @covers_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |booking| Booking.new( customer ) }
  end

  def all(id)
    sql = "SELECT * FROM bookings
   WHERE id = $1"
   values = [id]
   results = SqlRunner.run( sql, values )
   return Booking.new( results.first )
  end

  def update()
    sql = "UPDATE bookings
    SET
    (
      customer_id, restaurants_id, covers_id
      ) = ( $1, $2, $3)
    WHERE id = $4"

    values = [@customer_id, @restaurants_id, @covers_id]
  end

  def delete(id)
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values)
    return Booking.new( results.first )
  end

  def self.delete()
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end
  #
  # def check_availablity(restaurant, party_size, time_requested)
  #   customer['party_size'] += 1 if customer['party_size'] < 2
  #
  #   restaurant_open = restaurant.['opening_hours']["open"].chomp(":").to_i
  #   restaurant_close = restaurant.['opening_hours']["open"].chomp(":").to_i
  #
  #   if time_requested > restaurant_open && time_requested < restaurant_close
  #
  #     #code in here
  # 
  #   else
  #
  #     return "restaurant is not open then"
  #
  #   end
  # end

end
