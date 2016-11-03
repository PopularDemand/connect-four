require 'pry'

=begin
  columns - inst var, R
  #new - 
    HP: creates an empty column grid
        creates a red pos array
        and blue pos array
  #add_piece - adds an element to a players position array
                sets a last piece instance variable
      HP: given a player and col, it correctly adds the piece
      SP: missing either parameter, get argument error
          if enter invalid column, get an error and do not save position
  #render - print out the grid, 
            should be 7 wide, and 8 long
    HP: for every element in red's array (count) there should be that many
        x's on the board, same for blue
  #four_in_a_row? - check if the last piece that was played now completes 4 in row
                    for current player
      HP: place winning piece, return true
        : place non-win, return false
      SP: if no player given, throws error 
         
            
=end

class Board
  DIAGONAL_VECTORS = [
                       [[-3,-3], [-2,-2], [-1,-1], [0,0]],
                       [[-2,-2], [-1,-1], [0,0], [1,1]],
                       [[-1,-1], [0,0], [1,1], [2,2]],
                       [[0,0], [1,1], [2,2], [3,3]],
                       [[0,0],[1,-1],[2,-2],[3,-3]],
                       [[-3,3],[-2,2],[-1,1],[0,0]],
                       [[-2,2],[-1,1],[0,0],[1,-1]],
                       [[-1,1],[0,0],[1,-1],[2,-2]],
                     ]
  
  attr_reader :columns

  def initialize
    @red_positions = []
    @blue_positions = []
    @columns = Array.new(7) { Array.new(6) { ' ' }}
  end

  def add_piece(player, col)
    row = get_row(col)
    @columns[col][row] = player.symbol if valid_drop?(col)
    position = [col, row]
    player_array(player).push position
    @last_piece = position
  end

  def render
    rows = []
    6.times do |pos|
      print "|"
      @columns.each do |col|
        print "#{col[pos]}|"
      end
      puts
    end
    puts "---------------"
    print "|0|1|2|3|4|5|6|"
  end

  def four_in_a_row?(player)
    win_combos = winning_combos(@last_piece)
    puts "last piece: #{@last_piece}" # Debugging
    four_in_a_row = false
    win_combos.each do |direction, win_combo|
      # wincombo is array of array of vectors
      four_in_a_row = win_combo.all? do |position|
        player_array(player).include? position
        binding.pry
      end
      break if four_in_a_row == true
    end
    four_in_a_row
  end

  private

    def get_row(col)
      spaces = @columns[col].count{ |pos| pos == " " }
      row = spaces - 1
    end

    def valid_drop?(col)
      in_bounds?(col) && not_full?(col)
    end

    def not_full?(col)
      @columns[col].length < 7
    end

    def in_bounds?(col)
      (0..6).include? col
    end

    def winning_combos(position)
      combos = {}
      combos[:vert] = vertical_combos(position)
      combos[:hori] = horizontal_combos(position)
      combos[:diag] = diagonal_combos(position)
      combos
    end

    def vertical_combos(position)
      [
        position,
        [position[0], (position[1] + 1)],
        [position[0], (position[1] + 2)],
        [position[0], (position[1] + 3)]
      ]
    end

    def horizontal_combos(position)
      hori_combos =[]
      [(-3..0), (-2..1), (-1..2), (0..3)].each do |r|
        combos =[]
        r.each do |num|
          combos.push([(position[0] + num), position[1]])
        end
        hori_combos.push(combos)
      end
      hori_combos
    end

    def diagonal_combos(position)
      diag_combos = check_diagonals(DIAGONAL_VECTORS, position)
    end

    def check_diagonals(direction, position)
      poss_wins = [] # array of position coodinates
      direction.each do |vectors|
        single_combo = []
        vectors.each do |vector|
          single_combo << add(position, vector)
        end
        poss_wins.push(single_combo)
      end
      poss_wins
    end

    def add(position, v)
      [position[0] + v[0], position[1] + v[1]]
    end

    def player_array(player)
      player.color == 'red' ? @red_positions : @blue_positions
    end
end