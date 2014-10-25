require 'spec_helper'
require_relative '../lib/snipper.rb'

describe 'The Snipper' do

    options = Hash.new
    options[:file] = "examples/spec-test.txt"
    s = Snipper.new(options[:file]) 

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
      s.read_file
      # assumes unix environment
      expect(%x{wc -l #{s.instance_variable_get(:@filename)}}.split.first.to_i).to eq(s.instance_variable_get(:@file_array).length)
    end 
end
