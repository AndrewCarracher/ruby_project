require_relative('cover')
require_relative('customer')

class Booking

  attr_reader :id
  attr_accessor :covers_id, :customer_id, :time_available, :booking_time

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id'].to_i()
    @covers_id = options['covers_id'].to_i()
    @time_available = ["11:00", "13:00", "15:00", "17:00", "19:00", "21:00"]
    @booking_time = options['booking_time'].to_i()
  end

  def self.check_availablity( time )
    sql = " SELECT * FROM bookings
    WHERE booking_time = $1"
    values = [time]
    results = SqlRunner.run( sql, values )
    free = results.map { |booking| Booking.new( booking ) }

    if free != []

      number_of_bookings = free.length()

      if number_of_bookings > 3
        return false
      else
      return true
      end
    end

    return false
  end

  def save()
    sql = " INSERT INTO bookings
    (
      customer_id, restaurants_id, covers_id, booking_time
      )
      VALUES
      (
        $1, $2, $3, $4
        )
        RETURNING id"
    values = [@customer_id, @restaurants_id, @covers_id, @booking_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |booking| Booking.new( customer ) }
  end

  def self.find(id)
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


end
