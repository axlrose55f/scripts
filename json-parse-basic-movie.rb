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
d = (m['r_date'].empty?) ? ("01/01/" + m['year']) : m['r_date']

puts '(' + mToId[mid] + ',"' + m['m_name'] + '","' + Date.parse(d).to_s + '","India","Hindi","U/A"),'
#puts m['year'] + '|' + m['m_id']
end

#(id, name, year, country, language, 
#(4,'Sholay','India','','NR','',NULL,NULL,NULL,'No Desc',NULL,'1976-01-01',0,4,),
# (1,