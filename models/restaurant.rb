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

  def self.find_id_by_name(name)
    sql = "SELECT * FROM restaurants
    WHERE name = $1"
    values = [name]
    results = SqlRunner.run( sql, values )
    restaurant =  Restaurant.new( results.first )
    return restaurant.id
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

end
