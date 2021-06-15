# frozen_string_literal: true

require_relative 'lib/word'
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/display'
require_relative 'lib/savable'

def start_game
  display_game_start
  case choice_input_from_user
  when '1' then Game.new.play
  when '2'
    game = Game.load_game
    game.play if game != false
  end
end

def display_game_start
  puts Display.introduction
  puts Display.output_game_option
end

def choice_input_from_user
  user_input = nil
  loop do
    print Display.enter_valid_number
    user_input = gets.chomp
    break if user_input.to_i.between?(1, 3)
  end
  user_input
end

start_game
puts Display.end_credit
