class Offer
  attr_accessor :category_id, :name

  def initialize(attributes)
    self.category_id = attributes[:category_id].to_i
    self.name = attributes[:name]
  end

  alias :to_s :name
end
