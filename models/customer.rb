class Customer

  attr_accessor :first_name, :last_name, :email, :phone_number
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
    @phone_number = options['phone_number']
  end

end
