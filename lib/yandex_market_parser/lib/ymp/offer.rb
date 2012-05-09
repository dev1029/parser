module Ymp
  class Offer
    attr_accessor :id, :category_id, :name, :price

    def initialize(attributes)
      self.id = attributes[:id].to_i
      self.category_id = attributes[:category_id].to_i
      self.name = attributes[:name]
      self.price = attributes[:price].to_i
    end

    alias :to_s :name
  end
end
