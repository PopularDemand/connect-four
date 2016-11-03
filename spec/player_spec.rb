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
			expect{ Player.new(color: "red") }.not_to raise_error
		end

		it "saves the color as a public instance vairable" do
			player = Player.new(color: "red")
			expect(player.color).to eq("red")
		end

		it "saves symbol as 'X' if color is red" do
			player = Player.new(color: "red")
			expect(player.symbol).to eq("X")
		end

		it "saves symbol as 'O' if color is blue" do
			player = Player.new(color: "blue")
			expect(player.symbol).to eq("O")
		end

		xit "raises error if color is not blue or red" do
			expect{ Player.new(color: "green") }.to raise_error(ArgumentError)
		end
	end

end