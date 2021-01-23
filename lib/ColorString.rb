require 'rubygems'
require 'colorize'

# Print string in color
module ColorString
  def print_error(num)
    puts num.red
  end
end
