# frozen_string_literal: true

# class for player
class Player
  attr_reader :progress, :guessed_sofar

  def initailize(word_length)
    @progress = Array.new(word_length) { '_' }
    @guessed_sofar = []
  end

  def process_char(char, word)
    if word.include?(char)
      progress.map!.with_index { |item, index| char == word[index] ? char : item }
    else
      guessed_sofar.unshift(char)
    end
  end
end
