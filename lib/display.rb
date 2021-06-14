# frozen_string_literal: true

require 'string'

# Module for display
module Display
  def output_game_option
    %([1] Play a new game
      [2] Load game
      [3] Exit)
  end

  def introduction
    "#{'Hangman'.red.bold}/n" +
      'Welcome to Hangman'.blue.bold
  end

  def end_credit
    'Thanks for playing'
  end

  def input_your_guess
    'Enter a valid guess: '
  end

  def invalid_letter
    "#{'The letter you have entered is not valid.'.red} It has either already been guessed or is not an alphabet."
  end

  def enter_new_guess
    'Please, enter a new guess: '
  end

  def enter_valid_number
    'Please enter a number between 1 and 3 inclusive.'
  end

  def display_game_state(try, progress, already_guessed)
    "Tries left #{try}  Word completed so far #{progress} Word guessed so far #{already_guessed}."
  end
end
