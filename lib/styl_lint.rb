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

  def check_newline_after_semicolon(sp, index_string)
    s = StringScanner.new(sp)
    flag = s.scan_until(/\;+/)
    if flag.nil?
      # p 'okay fine'
    else
      index = s.pos
      if sp[index] == ' '
        p "line:#{index_string}|#{index}: there is a white space after semicolon"
      else
        p "line:#{index_string}|#{index}: must be a newline after semicolon" unless sp[index] == "\n"
        # p 'pksy fine' if sp[index] == "\n"
      end
      p "line:#{index_string}|#{index}: there is a white space before semicolon" if sp[index - 2] == ' '
    end
  end

  def check_newline_after_closing_bracket(sp, index_string)
    s = StringScanner.new(sp)
    flag = s.scan_until(/\}/)
    if flag.nil?
      # p 'okay fine'
    else
      index = s.pos
      p "line:#{index_string}|#{index}: must be a newline after closing bracket" unless sp[index] == "\n"
      # p 'okay fine' if sp[index] == "\n"
    end
  end

  def check_case_sentitive(sp, index_string)
    capital_count = sp.scan(/[A-Z]/).length
    p "line:#{index_string}: must be a small letter" unless capital_count <= 0
    # p 'okay fine' if capital_count.zero?
  end

  def check_error(error)
    index = 0
    file_data.each do |i|
      check_space_before_open_bracket(file_data[index], index+1)
      check_newline_after_open_bracket(file_data[index], index+1)
      check_intentation_for_regular_line(file_data[index], index+1)
      check_space_after_colon(file_data[index], index+1)
      check_newline_after_semicolon(i, index + 1)
      check_newline_after_closing_bracket(i, index + 1)
      check_case_sentitive(i, index + 1)
      index += 1
    end
  end
end
