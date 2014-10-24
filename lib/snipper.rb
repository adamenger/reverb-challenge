class Snipper  
  def initialize(options)  
    # Instance variables  
    @options = options
    @filename = @options[:file]
    @file_array = Array.new
    @people_array = Array.new
    tmp_file = File.open(@filename).each_line do |f|
      @file_array << f.chomp 
      self.guess_delimiter(f)
    end
    tmp_file.close
  end  

  def guess_delimiter(string)
    if /\w \w/.match(string)
      if @options[:verbose]
        puts "DEBUG: Matched on space"
      end   
      self.split_line(string, " ")
    elsif /,\s*/.match(string)
      if @options[:verbose]
        puts "DEBUG: Matched on comma"
      end   
      self.split_line(string, ",")
    elsif /\w \| \w/.match(string)
      if @options[:verbose]
        puts "DEBUG: Matched on pipe"
      end   
      self.split_line(string, "|")
    end
  end

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

    # add the person to the people_array class
    @people_array << name_hash
  end

  def people
    @people_array
  end

  def print
      table_header = "Last Name | First Name | Gender | Date of Birth | Favorite Color"
      puts table_header
      puts "-" * 50
    @people_array.each do |p|
      puts "#{p['LastName']} | #{p['FirstName']} | #{p['Gender']} | #{p['DateOfBirth']} | #{p['FavoriteColor']}"
    end
  end
end  
