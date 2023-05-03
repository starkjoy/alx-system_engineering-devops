#!/usr/bin/env ruby
puts ARGV[0].scan(/(.(from:.{12}).)(.(to:.{12}).)(.(flags:.{12}).)/).join
