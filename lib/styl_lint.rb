require 'strscan'
require_relative './color_string'

class Styllint
  def check_space_before_open_bracket(line, index_string, error)
    s = StringScanner.new(line)
    flag = s.scan_until(/\{+/)
    unless flag.nil?
      index = s.pos - 2
      error << "line:#{index_string}|#{index}: must be a space before {" unless line[index] == ' '
    end
  end

  def check_newline_after_open_bracket(line, index_string, error)
    s = StringScanner.new(line)
    flag = s.scan_until(/\{+/)
    unless flag.nil?
      index = s.pos
      error << "line:#{index_string}|#{index}: must be a newline after {" unless line[index] == "\n"
    end
  end

  def check_intentation_for_regular_line(line, index_string, error)
    s = StringScanner.new(line)
    flag = s.scan_until(/\;+/)
    unless flag.nil?
      temp = StringScanner.new(line)
      flag1 = temp.scan_until(/\{+/)
      unless flag1.nil?
        index = temp.pos
        error << "line:#{index_string}|#{index}: must be a newline after {" unless line[index] == "\n"
      else
        error << "line:#{index_string}|1: must be two space start" unless line[0] == ' ' && line[1] == ' '
      end
    end
  end

  def check_space_after_colon(line, index_string, error)
    s = StringScanner.new(line)
    flag = s.scan_until(/\:+/)
    unless flag.nil?
      index = s.pos
      error << "line:#{index_string}|#{index}: must be a space after colon " unless line[index] == ' '
      if line[index] == ' '
        error << "line:#{index_string}|#{index}: must be one space after colon " if line[index + 1] == ' '
      end
    end
  end

  def check_newline_after_semicolon(line, index_string, error)
    s = StringScanner.new(line)
    flag = s.scan_until(/\;+/)
    unless flag.nil?
      index = s.pos
      if line[index] == ' '
        error << "line:#{index_string}|#{index}: there is a white space after semicolon"
      else
        error << "line:#{index_string}|#{index}: must be a newline after semicolon" unless line[index] == "\n"
      end
      error << "line:#{index_string}|#{index}: there is a white space before semicolon" if line[index - 2] == ' '
    end
  end

  def check_newline_after_closing_bracket(line, index_string, error)
    s = StringScanner.new(line)
    flag = s.scan_until(/\}/)
    unless flag.nil?
      index = s.pos
      error << "line:#{index_string}|#{index}: must be a newline after closing bracket" unless line[index] == "\n"
    end
  end

  def check_case_sentitive(line, index_string, error)
    capital_count = line.scan(/[A-Z]/).length
    error << "line:#{index_string}: must be a small letter" unless capital_count <= 0
  end

  def check_error(error)
    index = 1
    file_data.each do |i|
      check_space_before_open_bracket(i, index, error)
      check_newline_after_open_bracket(i, index, error)
      check_intentation_for_regular_line(i, index, error)
      check_space_after_colon(i, index, error)
      check_newline_after_semicolon(i, index, error)
      check_newline_after_closing_bracket(i, index, error)
      check_case_sentitive(i, index, error)
      index += 1
    end
  end
end
