require 'colorize'

class ColorString
  attr_accessor :error

  def initialize(error = [])
    @error = error
  end

  def print_error(path)
    number_of_error = @error.size
    if number_of_error.zero?
      puts '-----------------------------------------'.colorize(:green)
      puts "There is #{number_of_error} Number of Error in #{path}\n".colorize(:yellow)
      puts '-----------------------------------------'.colorize(:green)
      puts 'Great! there is no error in css file'.colorize(:green)
    else
      puts "\n\n"
      puts '-----------------------------------------'.colorize(:green)
      puts "There is #{number_of_error} Number of Error in #{path}\n".colorize(:yellow)
      puts '-----------------------------------------'.colorize(:green)
      @error.each do |i|
        puts i.colorize(:red)
      end
      puts "\n\n"
    end
  end
end
