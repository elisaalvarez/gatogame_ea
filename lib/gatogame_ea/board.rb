# frozen_string_literal: true

require 'colorize'

module GatogameEa
  # Board class creates the n*n board and shows it.
  class Board
    attr_accessor :board
    def initialize(len = 3)
      @board = Array.new(len) { Array.new(len) }
      numbers = 0
      @board.map! do |x|
        x.map! do
          numbers += 1
        end
      end
    end

    def print_board
      @board.each do |x|
        print '|'
        x.each do |y|
          if y == 'X'
            print y.light_blue
          elsif y == 'O'
            print y.light_green
          else
            print y
          end
          print '|'
        end
        puts "\n"
      end
    end
  end
end
