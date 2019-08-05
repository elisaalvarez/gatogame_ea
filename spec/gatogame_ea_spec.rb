# frozen_string_literal: true

RSpec.describe GatogameEa::Board do
  context 'When the board has a value for len' do
    it 'initializes the board len*len' do
      board = GatogameEa::Board.new(4)
      expect(board.board).to eq([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]])
    end
  end
  context "When the board doesn't have a value for len" do
    it 'initializes the board 3*3' do
      board = GatogameEa::Board.new
      expect(board.board).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end
end
RSpec.describe GatogameEa::Game do
  context 'When the player O wins on the row 0' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [['O', 'O', 'O'], [4, 5, 6], [7, 8, 9]]
      expect(game.row_won?('O', 0)).to be(true)
    end
  end
  context 'When the player X wins on the row 1' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [[1, 2, 3], ['X', 'X', 'X'], [7, 8, 9]]
      expect(game.row_won?('X', 1)).to be(true)
    end
  end
  context 'When the player O wins on the row 2' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [[1, 2, 3], [4, 5, 6], ['O', 'O', 'O']]
      expect(game.row_won?('O', 2)).to be(true)
    end
  end
  context 'When the player X wins on the column 0' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [['X', 2, 3], ['X', 5, 6], ['X', 8, 9]]
      expect(game.column_won?('X', 0)).to be(true)
    end
  end
  context 'When the player O wins on the column 1' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [[1, 'O', 3], [4, 'O', 6], [7, 'O', 9]]
      expect(game.column_won?('O', 1)).to be(true)
    end
  end
  context 'When the player X wins on the column 2' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [[1, 2, 'X'], [4, 5, 'X'], [7, 8, 'X']]
      expect(game.column_won?('X', 2)).to be(true)
    end
  end
  context 'When the player O wins on the diagonal' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [['O', 2, 3], [4, 'O', 6], [7, 8, 'O']]
      expect(game.diagonal_won?('O')).to be(true)
    end
  end
  context 'When the player X wins on the inverse diagonal' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [[1, 2, 'X'], [4, 'X', 6], ['X', 8, 9]]
      expect(game.inverse_diagonal_won?('X')).to be(true)
    end
  end
  context 'When there\'s no winner (draw)' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [['X', 'O', 'X'], ['O', 'X', 'X'], ['O', 'X', 'O']]
      expect(game.draw?).to be(true)
    end
  end
  context 'When the space is already taken' do
    it 'returns false' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [[1, 2, 'X'], [4, 5, 6], ['X', 'O', 9]]
      expect(game.free_space?(3)).to be(false)
    end
  end
  context 'When the space is free' do
    it 'returns true' do
      game = GatogameEa::Game.new
      game.board = GatogameEa::Board.new(3)
      game.board.board = [[1, 2, 'X'], [4, 5, 6], ['X', 'O', 9]]
      expect(game.free_space?(1)).to be(true)
    end
  end
end
RSpec.describe GatogameEa::Validations do
  context 'When the entry is not an Integer' do
    it 'returns false' do
      validations = GatogameEa::Validations.new
      expect(validations.check_entry_integer('Hello')).to be(false)
    end
  end
  context 'When the entry is an Integer' do
    it 'returns the Integer' do
      validations = GatogameEa::Validations.new
      expect(validations.check_entry_integer('4')).to be(4)
    end
  end
  context 'When the Integer is in the valid range for the position on the board(1-len²)' do
    it 'returns true' do
      validations = GatogameEa::Validations.new
      expect(validations.check_entry_valid_range(5, GatogameEa::Board.new.board)).to be(true)
    end
  end
  context 'When the Integer is not in the valid range for the position on the board(1-len²)' do
    it 'returns false' do
      validations = GatogameEa::Validations.new
      expect(validations.check_entry_valid_range(10, GatogameEa::Board.new.board)).to be(false)
    end
  end
  context 'When the entry is YES' do
    it 'returns true' do
      validations = GatogameEa::Validations.new
      expect(validations.check_yes_or_no('Y') && validations.check_yes_or_no('y')).to be(true)
    end
  end
  context 'When the entry is NO' do
    it 'returns true' do
      validations = GatogameEa::Validations.new
      expect(validations.check_yes_or_no('N') && validations.check_yes_or_no('n')).to be(true)
    end
  end
  context 'When the entry is not YES or NO' do
    it 'returns false' do
      validations = GatogameEa::Validations.new
      expect(validations.check_yes_or_no('a')).to be(false)
    end
  end
end
