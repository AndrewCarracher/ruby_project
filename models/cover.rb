class Cover

  attr_accessor :space_available, :time
  attr_reader :id, :customer_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id'].to_i()
    @space_available = options['space_available'].to_i()
    @time = options['time']
  end

  def save()
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
    @id = results.first(['id'].to_i)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run( sql )
    return results.map { |customer| Customer.new( customer ) }
  end

  def all(id)
    sql = "SELECT * FROM covers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Cover.new( results.first )
  end

  def delete(id)
    sql = "DELETE FROM covers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values)
    return Cover.new( results.first )
  end

  def self.delete
    sql = "DELETE FROM covers"
    SqlRunner.run( sql )
  end
end
