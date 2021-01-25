require 'colorize'

class ColorString
  attr_accessor :error

  def initialize(error = [])
    @error = error
  end

  def print_error(path)
    number_of_error = @error.size
    if number_of_error.zero?
      puts 'file:'.concat(path)
      puts 'Great! there is no error in css file'.colorize(:green)
    else
      puts "\n\n"
      puts 'file:'.concat(path)
      puts number_of_error
      @error.each do |i|
        puts i.colorize(:red)
      end
      puts "\n\n"
    end
  end
end
