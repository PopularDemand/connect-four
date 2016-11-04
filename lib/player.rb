

class Player
  attr_reader :symbol

  def initialize(attrs)
    raise ArgumentError unless attrs[:symbol] == 'X' || attrs[:symbol] == 'O'
    @symbol = attrs[:symbol]
  end

  def get_input
    puts "Please type in an column number to drop your piece."
    response = gets.chomp
    response.match(/\A[0-6]\Z/) ? response : get_input
  end
end
