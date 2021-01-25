require 'open-uri'
class ReadFile
  def initialize(path)
    @path = path
    @file_data = []
    file = File.open(path, 'r')
    if file
      @file_data = file.readlines { |i| puts i; @file_data << i }
    else
      puts 'Unable to open file!'
    end
    file.close
    count = @file_data.size
    puts count.class
    j = 0
    puts j.class
    while j < count
      i = 0
      puts @file_data[j]
      while i < @file_data[j].size
        puts @file_data[j][i]
        i += 1
      end
      j += 1
    end
  end
end
