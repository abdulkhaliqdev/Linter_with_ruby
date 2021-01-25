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

  def check_intentation_for_regular_line(sp, index_string)
    s = StringScanner.new(sp)
    flag = s.scan_until(/\;+/)
    if flag.nil?
      # p 'okay fine'
    else
      temp = StringScanner.new(sp)
      flag1 = temp.scan_until(/\{+/)
      unless flag1.nil?
        index = temp.pos
        p "line:#{index_string}|#{index}: must be a newline after {" unless sp[index] == "\n"
      else
        # p 'okay fine' if sp[0] == ' ' && sp[1] == ' '
        p "line:#{index_string}|1: must be two space start" unless sp[0] == ' ' && sp[1] == ' '
      end
    end
  end

  def check_space_after_colon(sp, index_string)
    s = StringScanner.new(sp)
    flag = s.scan_until(/\:+/)
    if flag.nil?
      # p 'okay fine'
    else
      index = s.pos
      p "line:#{index_string}|#{index}: must be a space after colon " unless sp[index] == ' '
      if sp[index] == ' '
        p "line:#{index_string}|#{index}: must be one space after colon " if sp[index + 1] == ' '
        # p 'okay fine' unless sp[index + 1] == ' '
      end
    end
  end
end
