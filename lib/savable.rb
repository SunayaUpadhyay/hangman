# frozen_string_literal: true

require 'yaml'
require_relative 'display'

# module for serilization to and from yaml
module Savable
  DIR_NAME = 'saves'

  def load_saved_file
    fname = fname_from_user
    fname ? YAML.load(File.read(fname)) : false
  end

  def save_game(obj)
    user_chosen_fname = make_file_name
    if user_chosen_fname != 'eixt'
      fname_with_date = "#{Time.now.strftime('%Y-%m-%d at %k:%M')} #{user_chosen_fname}"
      fname = "#{DIR_NAME}/#{fname_with_date.gsub(' ', '_')}.yaml"
      File.open(fname, 'w') do |file|
        file.write(YAML.dump(obj))
      end
    end
    user_chosen_fname != 'exit'
  end

  def display_save_file(save_files)
    save_files.each_with_index do |fname, index|
      puts "[#{index}] #{clean_fname(fname)}"
    end
    puts "[#{save_files.length}] Exit"
  end

  def user_chosen_save_number(save_files)
    display_save_file(save_files)
    user_input = nil
    loop do
      print Display.enter_fname_number
      user_input = gets.chomp.to_i
      break if user_input.between?(0, save_files.length)
    end
    user_input
  end

  def fname_from_user
    save_files = Dir.glob("#{DIR_NAME}/*")
    index = user_chosen_save_number(save_files)
    if index >= save_files.length
      false
    else
      save_files[index]
    end
  end

  def clean_fname(fname)
    fname.gsub('_', ' ').gsub("#{DIR_NAME}/", '').gsub('.yaml', '')
  end

  def make_file_name
    fname = nil
    loop do
      puts Display.enter_fname
      fname = gets.chomp
      break if fname_valid?(fname)
    end
    fname
  end

  def fname_valid?(input)
    input.match(/[a-zA-Z0-9 ]/)
  end
end
