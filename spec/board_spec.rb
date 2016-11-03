require 'board'

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

describe Board do
  let(:board) { Board.new }

  describe '#initialiize' do  
    it "create empty column grid if no arguments passed" do
      expect(board.columns).to eq( Array.new(7) { Array.new(6) { ' ' }} )
    end
  end

  describe '#add_piece' do
    it "adds a symbol to the columns given a column and symbol" do
      board.add_piece('X', 3)
      expect(board.columns[3]).to eq([' ',' ',' ',' ',' ', 'X'])
    end

    it "throws an error if not given a symbol" do
      expect{ board.add_piece(3) }.to raise_error(ArgumentError)
    end

    it "throws error if not given a column" do
      expect{ board.add_piece('X') }.to raise_error(ArgumentError)
    end

    it "throws an error if column is out of range" do
      expect{ board.add_piece('X', 9) }.to raise_error(ArgumentError)
    end

    it "does not add a piece to the board if invalid input" do
      expect do
        board.add_piece('X', 9) 
        board.add_piece('X')
        board.add_piece(3)
      end.to raise_error(ArgumentError) # Ask Question
      expect(board.columns).to eq( Array.new(7) { Array.new(6) { ' ' }} )
    end
  end

  describe
end

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
  #four_in_a_row? - check if the last piece that was played now completes 4 in row
                    for current player
      HP: place winning piece, return true
        : place non-win, return false
      SP: if no player given, throws error 
=end