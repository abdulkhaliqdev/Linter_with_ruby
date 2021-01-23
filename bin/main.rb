#!/usr/bin/env ruby
# require 'StringScanner'
require_relative '../lib/ColorString'

include ColorString
num = '<h1> Hello my love </h1>'
ColorString.print_error(num)
