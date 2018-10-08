require_relative('../db/sql_runner')

class Cover

  attr_accessor :size
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @size = options['space_available'].to_i()
  end

  def save()
    sql = " INSERT INTO covers
    (
      size
      )
      VALUES
      (
        $1
        )
        RETURNING id"
    values = [@size]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM covers"
    results = SqlRunner.run( sql )
    return results.map { |cover| Cover.new( cover ) }
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
