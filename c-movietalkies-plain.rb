#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#puts "Reading file: #{ARGV[0]}"
doc = Nokogiri::HTML(open("#{ARGV[0]}"))



artist = doc.css('span#ctl00_ContentPlaceHolder1_ArtisteNamePlate1_lblArtistName').text
artist = artist.sub(/Filmography/, '').strip

artist_id = doc.css('a#ctl00_userControl_ArtistLeftMenu_anchorArtistMainPage').attr('href').value
artist_id = artist_id.gsub(/\D/,'')


u = doc.css('div#ctl00_ContentPlaceHolder1_UpdatePanel_filmography')
u.children.css('div.row').each do |e|
y = ""
e.children.css('span').each do |a|
y =  a.parent.css('input').attr('value').value
y = y + "|"
y = y + a.parent.css('a').text
y = y + "|"
y = y + a.parent.css('span').text
end
puts artist_id + "|" + artist + "|" + y 
end
