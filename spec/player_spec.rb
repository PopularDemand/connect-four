require 'player'

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

describe Player do
	describe '#initialize' do
		it "raise an ArgumentError if no parameters passed" do
			expect{ Player.new }.to raise_error(ArgumentError)
		end

		it "does not raise an error with parameters passed" do
			expect{ Player.new(symbol: "X") }.not_to raise_error
		end

		it "saves the symbol as a public instance vairable" do
			player = Player.new(symbol: "X")
			expect(player.symbol).to eq("X")
		end

		it "saves symbol as 'X' if symbol is X" do
			player = Player.new(symbol: "X")
			expect(player.symbol).to eq("X")
		end

		it "saves symbol as 'O' if symbol is O" do
			player = Player.new(symbol: "O")
			expect(player.symbol).to eq("O")
		end

		it "raises error if symbol is not O or X" do
			expect{ Player.new(symbol: "?") }.to raise_error(ArgumentError)
		end
	end

end