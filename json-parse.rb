#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

f = File.new("#{ARGV[0]}","r")
d = f.read
j = JSON.parse(d)

total = j.size

j.each do |m|
puts '{ "' + m['year'] + '","' + m['m_id'] + '"},'
end
