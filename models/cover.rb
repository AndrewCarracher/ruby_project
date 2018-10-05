class Cover

  attr_accessor :space_available, :time
  attr_reader :id, :customer_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id'].to_i()
    @space_available = options['space_available']
    @time = options['time']
  end

  def save()

  end

  def self.all()

  end

  def all(id)

  end

  def update()

  end

  def delete(id)

  end

  def self.delete

  end
end
