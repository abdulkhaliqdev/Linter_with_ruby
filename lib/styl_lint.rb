require 'strscan'
require_relative './color_string'

class Styllint
  def check_space_before_open_bracket(sp, index_string)
    s = StringScanner.new(sp)
    flag = s.scan_until(/\{+/)
    if flag.nil?
      # p 'okay fine'
    else
      index = s.pos - 2
      p "line:#{index_string}|#{index}: must be a space before {" unless sp[index] == ' '
      # p 'okay fine' if sp[index] == ' '
    end
  end

  def check_newline_after_open_bracket(sp, index_string)
    s = StringScanner.new(sp)
    flag = s.scan_until(/\{+/)
    if flag.nil?
      # p 'okay fine'
    else
      index = s.pos
      p "line:#{index_string}|#{index}: must be a newline after {" unless sp[index] == "\n"
      # p 'okay fine' if sp[index] == "\n"
    end
  end
end
