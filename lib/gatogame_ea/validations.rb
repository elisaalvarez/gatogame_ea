# frozen_string_literal: true

module GatogameEa
  # Validations for the inputs of the game
  class Validations
    def check_entry_integer(entry)
      /\d+/.match(entry) ? entry.to_i : false
    end

    def check_entry_valid_range(entry, board)
      entry <= (board.length**2) && entry.positive?
    end

    def check_yes_or_no(entry)
      entry.include?('y') || entry.include?('Y') || entry.include?('n') || entry.include?('N') 
    end
  end
end
