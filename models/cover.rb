require_relative('../db/sql_runner')

class Cover

  attr_accessor :restaurants_id, :size
  attr_reader :id

  def initialize(options)
    @restaurants_id = options['restaurants_id'].to_i()
    @id = options['id'].to_i() if options['id']
    @size = options['size'].to_i()
  end

  def save()
    sql = " INSERT INTO covers
    (
      restaurants_id, size
      )
      VALUES
      (
        $1, $2
        )
        RETURNING id"
    values = [@restaurants_id, @size]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM covers"
    results = SqlRunner.run( sql )
    return results.map { |cover| Cover.new( cover ) }
  end

  def self.find(name)
    sql = "SELECT * FROM covers
    WHERE name = $1"
    values = [name]
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
