require 'spec_helper'
require_relative '../lib/snipper.rb'

describe 'The Snipper' do

    options = Hash.new
    options[:file] = "examples/spec-test.txt"
    s = Snipper.new(options[:file]) 
    s.read_file
    processed_lines = s.process_lines(s.instance_variable_get(:@file_array))

    it "uses a string to initialize" do
      expect(s.instance_variable_get(:@filename)).to eq("examples/spec-test.txt")
    end

    it "can determine when a comma is used as a delimiter" do
      delimiter = s.guess_delimiter("Ross, Bob, Male, Blue, 01-01-1900")  
      expect(delimiter).to eq(",")
    end

    it "can determine when a space is used as a delimiter" do
      delimiter = s.guess_delimiter("Gaga Lady Female Black 01-01-1900")  
      expect(delimiter).to eq(" ")
    end

    it "can determine when a pipe is used as a delimiter" do
      delimiter = s.guess_delimiter("Marley | Bob | Male | Red | 01-01-1900")  
      expect(delimiter).to eq("|")
    end

    it "can return a hash when supplied a comma delimited line" do
      line = "Marley, Bob, Male, Red, 01-01-1900"
      name_hash = s.split_line(line, ",")
      expect(name_hash.class).to eq(Hash)
    end

    it "can return a hash when supplied a space delimited line" do
      line = "Marley Bob Male Red 01-01-1900"
      name_hash = s.split_line(line, " ")
      expect(name_hash.class).to eq(Hash)
    end
 
    it "can return a hash when supplied a pipe delimited line" do
      line = "Marley | Bob | Male | Red | 01-01-1900"
      name_hash = s.split_line(line, "|")
      expect(name_hash.class).to eq(Hash)
    end
  
    it "can load a file into memory which matches file on disk" do
      # assumes unix environment
      expect(%x{wc -l #{s.instance_variable_get(:@filename)}}.split.first.to_i).to eq(s.instance_variable_get(:@file_array).length)
    end 
  
    it "can process an array of lines from the loaded file and return an array" do
      expect(processed_lines.class).to eq(Array)
    end
  
    it "array contains a hash after processing lines" do
      expect(s.process_lines(s.instance_variable_get(:@file_array))[0].class).to eq(Hash)
    end

    it "can sort the loaded file and return an array" do
      sorted = s.sort(processed_lines, "LastName")
      puts sorted
      expect(sorted.class).to eq(Array)
    end 
    
    it "sorted array contains hash" do
      sorted = s.sort(processed_lines, ["LastName"])
      expect(sorted[0].class).to eq(Hash)
    end 
    
end
