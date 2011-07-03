#!/usr/bin/env ruby
require 'rubygems'
#require 'nokogiri'
#require 'open-uri'
require 'json'
require 'date'

genre = { "Action"=> 1,
"Adult"=> 2,
"Adventure"=> 3,
"Animation"=> 4,
"Biography"=> 5,
"Children"=> 6,
"Comedy"=> 7,
"Crime"=> 8,
"Documentary"=> 9,
"Drama"=> 10,
"Family"=> 11,
"Fantasy"=> 12,
"Film-Noir"=> 13,
"Foreign"=> 14,
"Game"=> 15,
"Health"=> 16,
"Historical"=> 17,
"Horror"=> 18,
"Music"=> 19,
"Musical"=> 20,
"Mystery"=> 21,
"Mythological"=> 22,
"News"=> 23,
"Patriotic"=> 24,
"Period"=> 25,
"Reality-TV"=> 26,
"Romance"=> 27,
"Sci-Fi"=> 28,
"Social"=> 29,
"Special"=> 30,
"Sports"=> 31,
"Suspense"=> 32,
"Talk"=> 33,
"Thriller"=> 34,
"War"=> 35,
"Western"=> 36,
"Epic"=> 37,
"Cult"=> 38 }




f1 = File.new("#{ARGV[0]}","r")
f2 = File.new("#{ARGV[1]}","r")


d1 = f1.read
d2 = f2.read

mo = JSON.parse(d1)
mToId = JSON.parse(d2)


total = mo.size

mo.each do |m|
mid = m['m_id']
m['genre'].each do |g|

 puts '(' + mToId[mid] + ',' + genre[g].to_s + '),'
#puts '(' + mToId[mid] + ',"' + m['m_name'] + '","' + Date.parse(d).to_s + '","India","Hindi","U/A"),'
end
end

