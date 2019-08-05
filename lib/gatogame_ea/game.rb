# frozen_string_literal: true

require 'gatogame_ea/player'
require 'gatogame_ea/validations'
require 'gatogame_ea/board'
require 'colorize'

module GatogameEa
  # All the game logic
  class Game
    attr_accessor :player1, :player2, :board, :validate
    def make_a_game(size = 0)
      @validate = Validations.new
      message = 'The size is not valid, initializing the default board (3x3)'.light_red
      loop do
        puts "What size it's going to be the board?\n*Please note that the minimum size is 3 and the max is 10*"
        size = @validate.check_entry_integer(gets.chomp)
        puts 'The entry is not a number!'.light_red if size == false
        break if size != false
      end
      @board = (size >= 3 && size <= 10 ? Board.new(size) : (puts message) || Board.new)
    end

    def create_players
      print 'Please tell me your name, Player 1: '
      @player1 = Player.new(gets.chomp, 'X')
      print 'Please tell me your name, Player 2: '
      @player2 = Player.new(gets.chomp, 'O')
      [@player1, @player2]
    end

    def show_players_information
      print "\nPlayer 1, your name is: #{@player1.name} and your color is: "
      print @player1.color.light_blue
      print "\nPlayer 2, your name is: #{@player2.name} and your color is: "
      print @player2.color.light_green
      print "\n"
    end

    def ask_for_a_space(player)
      move = 0
      loop do
        print "#{player} what's your move? "
        move = @validate.check_entry_integer(gets.chomp)
        move = (@validate.check_entry_valid_range(move, @board.board) ? move : false) if move != false
        puts 'The entry is not valid!'.light_red if move == false
        break if move != false
      end
      move
    end

    def choose_space(player)
      move = ask_for_a_space(player.name)
      until free_space?(move)
        puts 'That space is already taken!, choose another one'.light_red
        move = ask_for_a_space(player.name)
      end
      make_play(move, player.color)
    end

    def make_play(space, color)
      coordinates = get_coordinates(space)
      @board.board[coordinates[0]][coordinates[1]] = color
      @board.print_board
      coordinates
    end

    def get_coordinates(space)
      space -= 1
      column = space / @board.board.length
      column += 1 if ((column * @board.board.length) % @board.board.length).zero?
      row = space - ((column - 1) * @board.board.length)
      [column - 1, row]
    end

    def row_won?(color, row)
      y = 0
      win = false
      loop do
        win = @board.board[row][y] == color
        y += 1
        break if y >= @board.board.length || !win
      end
      win
    end

    def column_won?(color, column)
      x = 0
      win = false
      loop do
        win = @board.board[x][column] == color
        x += 1
        break if x >= @board.board.length || !win
      end
      win
    end

    def diagonal_won?(color)
      x = 0
      win = false
      loop do
        win = @board.board[x][x] == color
        x += 1
        break if x >= @board.board.length || !win
      end
      win
    end

    def inverse_diagonal_won?(color)
      x = @board.board.length - 1
      y = 0
      win = false
      loop do
        win = @board.board[x][y] == color
        x -= 1
        y += 1
        break if x.negative? || !win
      end
      win
    end

    def draw?
      @board.board.map { |x| x.select { |y| y.to_s == 'X' || y.to_s == 'O' } }.all? { |a| a.length == 3 }
    end

    def free_space?(space)
      coordinates = get_coordinates(space)
      @board.board[coordinates[0]][coordinates[1]].is_a?(Numeric)
    end
  end
end
