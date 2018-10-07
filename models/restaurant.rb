require_relative( 'cover.rb' )

class Restaurant

  attr_accessor :opening_hours, :total_covers, :covers
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @total_covers = options['total_covers']
    @opening_hours = options['opening_hours']
    @covers = ['covers']
  end

  def add_customer_to_cover(customer_id)
    sql = " INSERT INTO covers
    (
      customer_id
      )
      VALUES
      (
        $1
        )
        RETURNING id"
    values = [@customer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def remove_customer_from_cover(customer_id)
    "DELETE FROM covers
    WHERE customer_id = $1"
    results = SqlRunner.run( sql, values)
    return Cover.new( results.first )
  end

  def cover_can_be_booked_from()
    restaurant_open = @opening_hours["open"].chomp(":").to_i
    restaurant_close = @opening_hours["open"].chomp(":").to_i
    counter = restaurant_open
    result_hash = {}

    while counter < restaurant_close do
        result_string = counter.to_s + ":00"
        result_hash[result_string] = true
        counter += 1
      end

      return result_hash
  end

  def create_covers(cover_space)
      cover_time = cover_can_be_booked_from()

      new_cover = Cover.new({
        "space" => cover_space,
        "time" => cover_time
        })        
  end

end
