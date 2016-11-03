# Game
# - match draw (when board full)
# - win condition
# - player turn logic

=begin
  public interface
    #new - takes attrs{ player_red, player_blue, board }
    #play -
      HP - prints welcome
         - send message game loop
    # 
=end

class Game
  def initialize(attr = {})
    @player_red = attr[:player_red]
    @player_blue = attr[:player_blue]
    @board = attr[:board]
    @turn_count = 1 # Odd for red, Even for Blue, at 43 game over
    @win = false
  end

  def play
    welcome
    game_loop
  end

  def game_loop
    @board.render
    drop = current_player(@turn_count).get_input
    @board.add_piece(current_player(@turn_count), drop)
    check_win
  end

  private
    def current_player(count)
      count % 2 == 0 ? @player_blue : @player_red
    end

    def welcome
      puts "Welcome to Connect 4!"
      puts "To place a piece please type the number of the column (0-6)."
      puts "Press 'enter' to begin."
      gets
    end

    def check_win
      @board.four_in_a_row?(player)
    end

end
