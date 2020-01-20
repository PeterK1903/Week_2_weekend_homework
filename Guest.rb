class Guest

  attr_accessor :name, :age, :cash, :favesong

  def initialize(name, age, cash, favesong)
    @name = name
    @age = age
    @cash = cash
    @favesong = favesong
  end

  def guest_paying_fee(value)
    @cash -= value
  end

  def guest_cheering
    return "Woo! Pass the mic, i'm oan first!"
  end

end
