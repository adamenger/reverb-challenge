#!/usr/bin/env ruby

# add lib to load path
$: << './lib'

# we could use something like thor here, but am being selective about third party libraries.
require 'optparse'

# require snipper class
require 'snipper'

# instantiate empty hash to store our options
options = Hash.new 

# open optparser block to define valid options
OptionParser.new do |opts|

  opts.banner = "Usage: snipper.rb [options]"

  opts.on("-f", "--file [FILE]", "File to read from") do |f|
    options[:file] = f 
  end

end.parse!

d = Snipper.new(options[:file])  
d.print
