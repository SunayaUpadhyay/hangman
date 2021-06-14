# frozen_string_literal: true

# Class for word
class Word
  def self.generate
    content = File.readlines('word_list/dictionary.txt')
    content.filter { |row| row.strip.length.between?(5, 12) }.sample.strip.downcase
  end
end
