# frozen_string_literal: true

require 'gatogame_ea/game'
require 'gatogame_ea/validations'
require 'colorize'

module GatogameEa
  print "              ______________________             \n".light_magenta
  print '              |   '.light_magenta
  print 'Welcome to the'.light_yellow
  print "   |             \n".light_magenta
  print '(ฅ＾・ω・＾)ฅ-|  '.light_magenta
  print 'Tic Tac Toe game'.light_yellow
  print "  |-ฅ(＾・ω・＾ฅ)\n".light_magenta
  print "              |_________♡__________|             \n".light_magenta
  game = Game.new
  players = game.create_players
  current_player = players[0]
  play_again = ''
  loop do
    board = game.make_a_game
    puts '︵‿︵‿︵ /ᐠ｡ꞈ｡ᐟ\ ︵‿︵‿︵'.light_magenta
    puts '  Let\'s start the game!'.light_yellow
    puts '︵‿︵‿︵((ฅ) (ฅ))︵‿︵‿︵'.light_magenta
    game.show_players_information
    puts "#{current_player.name} starts!"
    board.print_board
    player_win, draw = false
    loop do
      coordinates = game.choose_space(current_player)
      player_win = game.diagonal_won?(current_player.color) || game.inverse_diagonal_won?(current_player.color) || game.row_won?(current_player.color, coordinates[0]) || game.column_won?(current_player.color, coordinates[1])
      draw = game.draw?
      puts player_win ? "Congratulations #{current_player.name}, you are the winner!!!" : draw ? "┍————- /ᐠ｡ꞈ｡ᐟ\\ ————┑\n|　 -Cat's game-   |\n┕————(..)(..)——————┙" : ''
      current_player = current_player.change_player(players[0], players[1])
      break if player_win || draw
    end
    loop do
      print 'Do you want to play again?(Y/N): '
      play_again = gets.chomp
      break if Validations.new.check_yes_or_no(play_again)
    end
    break if play_again.include?('n') || play_again.include?('N')
  end
  puts '              ________________________             '.light_magenta
  print '              |'.light_magenta
  print 'Thank you for playing!'.light_yellow
  print "|             \n".light_magenta
  print '(ฅ＾・ω・＾)ฅ-|       '.light_magenta
  print 'Bye, bye'.light_yellow
  print "       |-ฅ(＾・ω・＾ฅ)\n".light_magenta
  puts '              |__________♡___________|             '.light_magenta
end
