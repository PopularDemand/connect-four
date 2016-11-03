require 'game.rb'
require 'player.rb'
require 'board.rb'

=begin
  public interface
    #new - takes attrs{ player_red, player_blue, board }
    #play -
      HP - prints welcome
         - send message game loop
  
  private interface
    #game_loop - 
=end

describe Game do


  let(:player_x){ Player.new(symbol: 'X') }
  let(:player_o){ Player.new(symbol: 'O') } 
  let(:board){ Board.new }
  let(:game){ Game.new(x_player: player_x, o_player: player_o, board: board) }
  
  describe "#initialize" do
    it "initializes a game with attributes given" do
      expect{ Game.new(player_x: player_x, player_o: player_o, board: board) }.not_to raise_error
    end

    it "throws an error if initialized without board" do
      expect{ Game.new(player_x: player_x, player_o: player_o) }.to raise_error(ArgumentError)
    end

    it "throws an error if initialized without player x" do
      expect{ Game.new(board: board, player_o: player_o) }.to raise_error(ArgumentError)
    end

    it "throws an error if initialized without player o" do
      expect{ Game.new(player_x: player_x, board: board) }.to raise_error(ArgumentError)
    end
  end
end