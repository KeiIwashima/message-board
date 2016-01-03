class Shop
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def print_details
    puts "shop: #{name}"
  end
end

class PetShop < Shop
  attr_accessor :animals

  def print_details
    super
    print_animals
  end

  def print_animals
    puts "animals: #{animals.join(',')}"
  end
end