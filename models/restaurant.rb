require_relative( 'cover.rb' )

class Restaurant

  attr_accessor :name, :opening_hours, :table_hours
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @open = options['open']
    @close = options['close']
  end

  def save()
    sql = " INSERT INTO restaurants
    (
      name, open, close
      )
      VALUES
      (
        $1, $2, $3
        )
        RETURNING id"
    values = [@name, @open, @close]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM restaurants"
    results = SqlRunner.run( sql )
    return results.map { |restaurant| Restaurant.new( restaurant ) }
  end

  def all(id)
    sql = "SELECT * FROM restaurants
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Restaurant.new( results.first )
  end

  def delete(id)
    sql = "DELETE FROM restaurants
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values)
    return Restaurant.new( results.first )
  end

  def self.delete
    sql = "DELETE FROM restaurants"
    SqlRunner.run( sql )
  end

  def self.find_by_name( name )
    sql = "SELECT * FROM restaurants
    WHERE name = $1"
    values = [name]
    results = SqlRunner.run( sql, values )
    return Restaurant.new( results.first )
  end

##  OLD CODE BELOW  ##


  # def add_customer_to_cover(customer_id)
  #   sql = " INSERT INTO covers
  #   (
  #     customer_id
  #     )
  #     VALUES
  #     (
  #       $1
  #       )
  #       RETURNING id"
  #   values = [@customer_id]
  #   results = SqlRunner.run(sql, values)
  #   @id = results.first()['id'].to_i
  # end

  # def remove_customer_from_cover(customer_id)
  #   "DELETE FROM covers
  #   WHERE customer_id = $1"
  #   results = SqlRunner.run( sql, values)
  #   return Cover.new( results.first )
  # end

  # def cover_can_be_booked_from()
  #   restaurant_open = @opening_hours["open"].chomp(":").to_i
  #   restaurant_close = @opening_hours["open"].chomp(":").to_i
  #   counter = restaurant_open
  #   result_hash = {}
  #
  #   while counter < restaurant_close do
  #       result_string = counter.to_s + ":00"
  #       result_hash[result_string] = true
  #       counter += 1
  #     end
  #
  #     return result_hash
  # end
  #
  # def create_covers(cover_space)
  #     cover_time = cover_can_be_booked_from()
  #
  #     new_cover = Cover.new({
  #       "space" => cover_space,
  #       "time" => cover_time
  #       })
  # end

end
