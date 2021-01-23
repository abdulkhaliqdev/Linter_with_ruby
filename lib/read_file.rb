require 'open-uri'
class ReadFile
  def initialize(path)
    @path = path.concat('.css')
    @file_data = []
    puts @path
    file = File.read(@path)
    # if file
    #   file.each do |i|
    #     @file_data << i
    #   end
    #   f.close
    #   @file_data.each { |i| puts i }
    # else
    #   puts 'Unable to open file!'
    # end
  end
end
