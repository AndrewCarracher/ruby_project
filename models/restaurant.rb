require_relative( 'cover.rb' )

class Restaurant

  attr_accessor :opening_hours :total_covers
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @total_covers = options['total_covers']
    @opening_hours = options['opening_hours']
  end

  def add_customer_to_table(customer_id)
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

  def remove_customer_from_clan(customer_id)
    "DELETE FROM covers
    WHERE customer_id = $1"
    results = SqlRunner.run( sql, values)
    return Cover.new( results.first )
  end
end
