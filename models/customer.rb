require_relative('../db/sql_runner')

class Customer

  attr_accessor :first_name, :last_name, :email, :phone_number, :party_size
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
    @phone_number = options['phone_number']
    @party_size = options['party_size']
  end

  def save()
    sql = " INSERT INTO customers
    (
      first_name, last_name, email, phone_number, party_size
      )
      VALUES
      (
        $1, $2, $3, $4, $5
        )
        RETURNING id"
    values = [@first_name, @last_name, @email, @phone_number, @party_size]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.find_by_name( f_name, l_name )
    sql = "SELECT * FROM customers
    WHERE first_name = $1
    AND last_name = $2"
    values = [f_name, l_name]
    results = SqlRunner.run( sql, values )
    return results.map { |customer| Customer.new( customer ) }.first
  end

  def all(id)
    sql = "SELECT * FROM customers
   WHERE id = $1"
   values = [id]
   results = SqlRunner.run( sql, values )
   return Customer.new( results.first )
  end

  def self.all(id)
    sql = "SELECT * FROM customers
   WHERE id = $1"
   values = [id]
   results = SqlRunner.run( sql, values )
   return Customer.new( results.first )
  end

  def update(first_name, last_name, email, phone_number, party_size)
    sql = "UPDATE customers
    SET
    (
      first_name,
      last_name,
      email,
      phone_number,
      party_size
      ) = ( $1, $2, $3, $4, $5)
    WHERE id = $6"

    values = [first_name, last_name, email, phone_number, party_size, @id]
    SqlRunner.run(sql, values)
  end

  def delete(id)
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values)
    return Customer.new( results.first )
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values)
  end

  def self.delete()
    sql = "DELETE FROM customers"
    SqlRunner.run( sql )
  end
end
