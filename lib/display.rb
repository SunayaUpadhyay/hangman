# frozen_string_literal: true

require_relative 'string'

# Module for display
module Display
  extend self

  def output_game_option
    <<-DOCS

    [1] Play a new game
    [2] Load game
    [3] Exit

    DOCS
  end

  def introduction
    'Welcome to Hangman'.red.bold
  end

  def end_credit
    'Thanks for playing!'
  end

  def input_your_guess
    'Enter a valid guess: '
  end

  def invalid_letter
    <<~DOCS
      #{'The letter you have entered is not valid.'.red}
      #{'Either it has already been guessed or it is not an alphabet.'.blue}
    DOCS
  end

  def enter_new_guess
    'Please, enter a new guess: '
  end

  def enter_valid_number
    'Please enter a number between 1 and 3 inclusive: '
  end

  def display_game_state(try, progress, already_guessed)
    "Tries left #{try}  Word completed so far #{progress.join(' ')} Word guessed so far #{already_guessed.join(', ')}."
  end

  def congratulation_message
    'Congratulation, you have guessed the correct word.'
  end

  def try_next_time_message
    'You were very close. Try next time.'
  end

  def correct_answer(answer)
    "The correct word was #{answer}".blue
  end

  def enter_fname
    'Please enter a valid file name. Name should be alphanumberic without any symbols.'
  end

  def enter_fname_number
    'Please enter the index of the file name you want to load: '
  end

  def successful_saved
    'Your file has been sucessfully saved in the disk'.blue
  end
end
