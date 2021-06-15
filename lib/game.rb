# frozen_string_literal: true

require_relative 'display'
require_relative 'word'
require_relative 'player'
require_relative 'savable'

# Game class
class Game
  extend Savable
  include Display

  attr_accessor :word, :player, :tries, :user_input, :to_save

  GAME_TRIES = 12

  def initialize
    @word = Word.generate.split('')
    @player = Player.new(word.length)
    @tries = GAME_TRIES
    @user_input = nil
    @to_save = nil
  end

  def input_from_user
    letter = nil
    loop do
      print input_your_guess
      self.user_input = gets.chomp.downcase
      letter = user_input[0]
      break if !input_invalid?(letter) || exit? || save_game?

      puts invalid_letter
    end
    letter
  end

  def input_invalid?(letter)
    !letter.match(/[a-z]/) || player.guessed_sofar.include?(letter) || player.progress.include?(letter)
  end

  def play
    game_loop
    conclusion unless to_save || exit?
  end

  def self.load_game
    load_saved_file
  end

  def game_loop
    display_state
    while tries.positive?
      char = input_from_user
      if save_game?
        Game.save_game(self)
        puts successful_saved
        break
      end
      break if exit?

      process_player_and_display(char, word)
      break if player.won?
    end
  end

  def save_game?
    self.to_save = user_input == 'save'
  end

  def process_player_and_display(char, word)
    self.player = player.process_char(char, word)
    decrement_tries
    display_state
  end

  def display_state
    puts display_game_state(tries, player.progress, player.guessed_sofar)
  end

  def exit?
    user_input == 'exit'
  end

  def decrement_tries
    self.tries -= 1 if player.incorrect_guess
  end

  def conclusion
    puts correct_answer(word)
    if player.won?
      puts congratulation_message
    else
      puts try_next_time_message
    end
  end
end
