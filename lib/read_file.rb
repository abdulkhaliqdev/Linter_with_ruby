class ReadFile
  private

  def read_file
    file = File.open(@path, 'r')
    file_data
    if file
      file_data = file.readlines { |i| file_data << i }
    else
      puts 'Unable to open file!'
    end
    file.close
    file_data
  end

  public

  attr_reader :file_data

  def initialize(path)
    @path = path
    @file_data = []
    @file_data = read_file
  end
end
