class Restaurant

  attr_accessor :opening_hours
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @opening_hours = options['opening_hours']
  end

end
