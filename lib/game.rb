# frozen_string_literal: true

# Game class
class Game
  include 'display'

  attr_reader :word, :player

  GAME_TRIES = 12

  def initailize
    @word = Word.generate.split('')
    @player = Player.new(word.length)
  end

  def start_game
    display_game_start
    case choice_input_from_user
    when '1' then play_new
    when '2' then load_game
    when '3' then puts end_credit
    end
  end

  def display_game_start
    puts introduction
    puts output_game_option
  end

  def choice_input_from_user
    print enter_valid_number
    user_input = gets.chomp until user_input.to_i.between?(1, 3)
    user_input
  end

  def letter_from_user
    print input_your_guess
    letter = gets.chomp[0]
    if !letter.match(/[A-Za-z]/) || player.guessed_sofar.include?(letter)
      puts invalid_letter
      letter_from_user
    end
    letter
  end

  def play_new
    game_loop
    conclusion
  end

  def game_loop
    GAME_TRIES.times do |try|
      display_game_state(try, player.progress, player.guessed_sofar)
      player.process_char(char, word)
    end
  end
end
