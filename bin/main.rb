#!/usr/bin/env ruby
require_relative '../lib/read_file'
require_relative '../lib/styl_lint'
require_relative '../lib/color_string'
path = './index.css'
file = ReadFile.new(path)
errors = ColorString.new
checks = Styllint.new
checks.check_error(file.file_data, errors.error)
errors.print_error(path)
path2 = './index2.css'
file2 = ReadFile.new(path2)
errors2 = ColorString.new
checks2 = Styllint.new
checks2.check_error(file2.file_data, errors2.error)
errors2.print_error(path2)
