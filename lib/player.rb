=begin
  public interface: 
    color - instance vairable, R
      - can read
    symbol - inst var, R
      - can read
    #new - takes attrs={color}
      HP - user initialize with attr
         - sets color and symbol
      SP - initialize with nothing
    #get_input - returns an integer
      HP - return an integet in column range
=end

class Player
  attr_reader :color, :symbol

  def initialize(attrs = {})
    @color = attrs[:color]
    @symbol = self.color == "red" ? 'X' : 'O'
  end

  def get_input
    puts "Please type in an column number to drop your piece."
    response = gets.chomp.to_i
    response.match(/\A[0-6]\Z/) ? response : input
  end
end
