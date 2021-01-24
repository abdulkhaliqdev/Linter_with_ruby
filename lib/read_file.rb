require 'open-uri'
class ReadFile
  def initialize(path)
    @path = path
    @file_data = []
    puts @path
    file = File.open(path, 'r')
    if file
      @file_data = file.readlines { |i| puts i; @file_data << i }
      # File.open(file, 'r') do |strings|
      #   @file_data = strings.readlines.map(&:chomp)
      # end
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
    # @file_data.each do |i|
    #   puts i
    # end
  end
end
