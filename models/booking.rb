require_relative('cover')
require_relative('customer')
require('pry')

class Booking

  attr_reader :id
  attr_accessor :covers_id, :customers_id, :time_available, :booking_time

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customers_id = options['customers_id'].to_i()
    @covers_id = options['covers_id'].to_i()
    @time_available = ["11:00", "13:00", "15:00", "17:00", "19:00", "21:00"]
    @booking_time = options['booking_time'].to_i()
  end

  def self.check_availablity( time, space, restaurants_name )

    cover_id_array = Cover.all_of_covers_by_restaurant_name(restaurants_name)

    for cover in cover_id_array do

      sql = " SELECT * FROM bookings
      WHERE booking_time = $1
      AND covers_id = $2"
      values = [time, cover]
      results = SqlRunner.run( sql, values )
      free = results.map { |booking| Booking.new( booking ) }


      if free.length != 0

        for booking in free
          free_space = Cover.calculate_free_space( booking.id )

          if free_space - space >= 0

            return booking.id
          end
        end

        return false
      end

      return cover_id_array.first

    end
  end

  def save()
    sql = " INSERT INTO bookings
    (
      customers_id, covers_id, booking_time
      )
      VALUES
      (
        $1, $2, $3
        )
        RETURNING id"
    values = [@customers_id, @covers_id, @booking_time]
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

  def self.find_time(customers_id, cover_id)
    sql = "SELECT * FROM bookings
   WHERE customers_id = $1 AND covers_id = $2"
   values = [customers_id, cover_id]
   results = SqlRunner.run( sql, values )
   if results.first == nil
     return "not found"
   else
     booking = Booking.new( results.first )
     return booking.booking_time
   end
  end

  def self.find_id(customers_id, cover_id, booking_time)
    sql = "SELECT * FROM bookings
   WHERE customers_id = $1 AND covers_id = $2
   AND booking_time = $3"
   values = [customers_id, cover_id, booking_time]
   results = SqlRunner.run( sql, values )
   if results.first == nil
     return "not found"
   else
     booking = Booking.new( results.first )
     return booking.id
   end
  end

  def update(time)
    sql = "UPDATE bookings
    SET
    (
      booking_time
      ) = ( $1)
    WHERE id = $2"

    values = [@booking_time]
  end

  def delete(id)
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values)
  end

  def self.delete()
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end


end
