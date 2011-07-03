#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#puts "Reading file: #{ARGV[0]}"
doc = Nokogiri::HTML(open("#{ARGV[0]}"))



artist = doc.css('span#ctl00_ContentPlaceHolder1_ArtisteNamePlate1_lblArtistName').text
artist =  ((artist == nil) || (artist.empty?)) ? "" : artist.sub(/Filmography/, '').strip

artist_id = doc.css('a#ctl00_userControl_ArtistLeftMenu_anchorArtistMainPage').attr('href').value
/\/(\d+)\//.match(artist_id) unless ((artist_id == nil) || (artist_id.strip.empty?))
artist_id = $1


u = doc.css('div#ctl00_ContentPlaceHolder1_UpdatePanel_filmography')
movies = ""
u.children.css('div.row').each do |e|
a = e.children.css('span')[0]
	m_id = a.parent.css('input').attr('value').value
	m_name =  a.parent.css('a').text
	role = a.parent.css('span').text
	role = role.sub(/as/, '').strip
	
	m_role = '["' + role.gsub(/\W*\,\W*/,'","') + '"]'	
	
movies = movies + '{ "id":"' + m_id + '","mname":"' + m_name + '","role":' + m_role + '},'

end
movies = "[" + movies.chop + "]" 

if ((artist_id != nil)  && (!artist_id.empty?))
puts '{"id":"'    + artist_id +
     '","name":"' + artist +
     '","movies":' + movies + '},'
end     
