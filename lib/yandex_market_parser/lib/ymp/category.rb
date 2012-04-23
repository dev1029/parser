module Ymp
  class Category
    attr_accessor :id, :parent_id, :name

    def initialize(attributes)
      self.id = attributes[:id].to_i
      self.parent_id = attributes[:parent_id].to_i
      self.name = attributes[:name]
    end

    alias :to_s :name
  end
end
