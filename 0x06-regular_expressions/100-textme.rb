#!/usr/bin/env ruby
puts ARGV[0].scan(/.(from:.{12})./).join
puts ARGV[1].scan(/.(to:.{12})./).join
puts ARGV[2].scan(/.(flags:.{12})./).join
