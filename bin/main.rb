#!/usr/bin/env ruby
# require 'StringScanner'
# require_relative '../lib/ColorString'

# include ColorString
# num = '<h1> Hello my love </h1>'
# ColorString.print_error(num)
require_relative '../lib/read_file'
path = '../lib/index'
ReadFile.new(path)
# user_file = File.read('../index.css')
# file_data = user_file.readlines
# file_data.each { |i| puts i }
