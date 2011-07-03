#!/usr/bin/env ruby
require 'rubygems'
#require 'nokogiri'
#require 'open-uri'
require 'json'
require 'date'


f1 = File.new("#{ARGV[0]}","r")
f2 = File.new("#{ARGV[1]}","r")


d1 = f1.read
d2 = f2.read

mo = JSON.parse(d1)
mToId = JSON.parse(d2)


total = mo.size

mo.each do |m|
mid = m['m_id']
rate = m['rate']
rate_id = rate.to_f.round  unless (rate == nil || rate == "0")
 puts '( 8,' + mToId[mid] + ',"Movie",' + rate_id.to_s + ',"2011-06-12 01:11:43","2011-06-12 01:11:43"),' unless (rate == nil || rate == "0")
end

