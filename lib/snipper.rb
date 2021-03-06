# Class to be instantiated which handles the bulk of list processing
class Snipper  
  def initialize(filename)  

    # array for slurping file lines into
    @file_array = Array.new

    # the filename which we've passed using -f 
    @filename = filename
    
    # empty array which is intended to be filled with musicians
    @people_array = Array.new

  end  
  
  # this function will determine which delimiter is used on a specific line in a file
  def guess_delimiter(string)

    # match just on a space delimited line
    if /\w \w/.match(string)
     return " "
    # match on comma delimited line
    elsif /,\s*/.match(string)
     return ","
    # match on pipe delimited line
    elsif /\w \| \w/.match(string)
     return "|"
    end
  end
  
  # after we've determined which delimiter the line is using, this function will split and add it to people_array
  def split_line(line, delimiter)

    # split the given line and add it to the people array
    split_line = line.split(delimiter)

    # create a hash to store all people data, cleaning up the strings as we go along
    name_hash = {
      "LastName" => split_line[0].strip, 
      "FirstName" => split_line[1].strip, 
      "Gender" => split_line[2].strip, 
      "FavoriteColor" => split_line[3].strip, 
      "DateOfBirth" => split_line[4].chomp
    }
  end

  def read_file
     # This is the file we'll open with the -f flag
    tmp_file = File.open(@filename).each_line do |f|
      @file_array << f.chomp 
    end
    # close the file after we're done with it
    tmp_file.close
  end

  def process_lines(lines)
    processed_array = Array.new
    lines.each do |line|
      processed_array << self.split_line(line.chomp, self.guess_delimiter(line))
    end
    processed_array
  end

  def sort(array, attribute)
    array.sort_by { |k| k[attribute] }
  end
  
  # method which is intended to be used for pretty rinting list of musicians
  def print
      table_header = "Last Name | First Name | Gender | Date of Birth | Favorite Color"
      puts table_header
      puts "-" * 50
    @people_array.each do |p|
      puts "#{p['LastName']} | #{p['FirstName']} | #{p['Gender']} | #{p['DateOfBirth']} | #{p['FavoriteColor']}"
    end
  end
end 
