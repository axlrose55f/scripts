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
aToId = JSON.parse(d2)

mo.each do |m|
aid = m['id']
#d = (m['r_date'].empty?) ? ("01/01/" + m['year']) : m['r_date']
puts '(' + aToId[aid] + ',"' + m['name'] +  '","' +  m['name']  +'","India"),'
end

#(id, name, country, birth_name),
#(4,'Sholay','India','','NR','',NULL,NULL,NULL,'No Desc',NULL,'1976-01-01',0,4,),
