# GatogameEa

This is the Tic Tac Toe game or Juego del Gato in Mexico (hence the name of this gem "gatogame"). This game is made for two human players, defined by the classic X and O symbols, and an n*n board that the user can define at the beginning of each game, for convinence "n" is validated to be minimum 3 and maximum 10 (considering the possibility that less than 3 the game would not function and more than 10 it would be more difficult to play and finish a game).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gatogame_ea'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gatogame_ea

## Usage

To use this game, first of all you need to create the players specifying the names of each one, then the board size(n), if the size is not in the valid range, a standar 3*3 board would be initialized.
For the actual playing, an n*n board would show on the screen, there you can see the numbers for each possition on it, you can choose any of those numbers, knowing that you can't choose an already taken space (don't worry, if you do, the game would ask again).
The game ends when one of the players or the cat wins (when the cat wins means that is a draw) and you can choose play another game or end the game (this finishes the program).

## The rules

Rules for the game are simple, as it follows:
*You can't choose an already taken space.
*The board can't be lesser than 3 or greater than 10.
*When a player wins, the next game is started by the looser.
*When the cat wins, the second to last player to make the last movement starts.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sp4ceunicorn/gatogame_ea. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GatogameEa project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sp4ceunicorn/gatogame_ea/blob/master/CODE_OF_CONDUCT.md).
