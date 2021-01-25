require 'colorize'

# Print string in color
class ColorString
  attr_accessor :error

  def initialize(error = [])
    @error = error
  end

  def print_error
    @error.each do |i|
      puts i.colorize(:red)
    end
  end
end
