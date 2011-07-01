#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#puts "Reading file: #{ARGV[0]}"
doc = Nokogiri::HTML(open("#{ARGV[0]}"))

movie_id = "#{doc.css('a#ctl00_usercontrol_MovieLeftMenu_anchormainDetails').attr('href').value}"
/\/(\d+)\//.match(movie_id) unless movie_id.strip.empty?
movie_id = $1

name_d = "#{doc.css('span#ctl00_ContentPlaceHolder1_MovieNamePlate1_lblMovieName').text}"

name = ((name_d == nil) || name_d.empty?) ? "" : (/(.*)\W\((\d\d\d\d)\)/.match(name_d)[1]) 
year = ((name_d == nil) || name_d.empty?) ? "" : (/.*\((\d\d\d\d)\)/.match(name_d)[1])

releasedate =  "#{doc.css('span#ctl00_ContentPlaceHolder1_MovieMainDetails1_lblMovieReleaseDate').text}"
rate = "#{doc.css('span#ctl00_ContentPlaceHolder1_MovieMainDetails1_lblAverageRate').text}"
vote = "#{doc.css('span#ctl00_ContentPlaceHolder1_MovieMainDetails1_lblRateCount').text}"


genre = ""
doc.css('table#ctl00_ContentPlaceHolder1_MovieMainDetails1_DataList_Genre').children.css('a').children.each do |a| 
 genre = genre + '"' +a.text + '",'
end

genre = "[" + genre.chop + "]"

director = ""
doc.css('table#ctl00_ContentPlaceHolder1_MovieMainDetails1_DataList_MovieDirector').children.css('a').each do |a| 
 d_id = /\/(\d+)\//.match(a.attr('href'))[1]
 d_name = a.text
 director = director + '{' + d_id + ':' + a.text + '},'
end
director = "[" + director.chop +  "]"

producer = ""
doc.css('table#ctl00_ContentPlaceHolder1_MovieMainDetails1_DataList_Producer').children.css('a').each do |a| 
 p_id = /\/(\d+)\//.match(a.attr('href'))[1]
 p_name = a.text
 producer = producer + '{' + p_id + ':' + a.text + '},'
end
producer = "[" + producer.chop +  "]"

if ((movie_id != nil)  && (!movie_id.empty?))
#puts movie_id + "|" + name + "|" + year + "|" + releasedate + "|" + rate + ":" + vote + "@" + genre + "#D:" + director + "$P:" + producer
puts movie_id + "|" + name + "|"  + year + "|" + releasedate + "|" + rate + ":" + vote + "|@" + genre + "|#D:" + director + "|$P:" + producer

end