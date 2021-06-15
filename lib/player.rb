# frozen_string_literal: true

# class for player
class Player
  attr_reader :progress, :guessed_sofar
  attr_accessor :incorrect_guess

  def initialize(word_length)
    @progress = Array.new(word_length) { '_' }
    @guessed_sofar = []
    @incorrect_guess = false
  end

  def process_char(char, word)
    if word.include?(char)
      progress.map!.with_index { |item, index| char == word[index] ? char : item }
      self.incorrect_guess = false
    else
      guessed_sofar.unshift(char)
      self.incorrect_guess = true
    end
    self
  end

  def won?
    progress.all? { |val| val != '_' }
  end
end
