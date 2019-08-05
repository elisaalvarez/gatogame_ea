# frozen_string_literal: true

module GatogameEa
  # Player class for create, show and change players.
  class Player
    attr_accessor :name, :color
    def initialize(name, color)
      @name = name
      @color = color
    end

    def change_player(player1, player2)
      self == player1 ? player2 : player1
    end
  end
end
