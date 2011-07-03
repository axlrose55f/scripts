#!/usr/bin/env ruby
require 'rubygems'
#require 'nokogiri'
#require 'open-uri'
require 'json'
require 'date'

roles = {"Hero"=>"1",
"Heroine"=>"2",
"Villain"=>"3",
"Vamp"=>"4",
"Comedian"=>"5",
"Supporting Actor"=>"6",
"Supporting Actress"=>"7",
"Guest Appearance"=>"8",
"Friendly Appearance"=>"9",
"Artist"=>"10",
"Accounts Department"=>"21",
"Action Co-ordinator"=>"22",
"Action Director"=>"23",
"Animators"=>"24",
"Art Director"=>"25",
"Assistant Action Director"=>"26",
"Assistant Art Director"=>"27",
"Assistant Choreographer"=>"28",
"Assistant Cinematographer"=>"29",
"Assistant Costume Designer"=>"30",
"Assistant Director"=>"31",
"Assistant Editor"=>"32",
"Assistant Line Producer"=>"33",
"Assistant Make-Up Designer"=>"34",
"Assistant Sound Designer"=>"35",
"Associate Director"=>"36",
"Associate Producer"=>"37",
"Associate Screenplay"=>"38",
"Audiography"=>"39",
"Background Sound"=>"40",
"Banner"=>"41",
"Boom Operators"=>"42",
"Camera Attendants"=>"43",
"Casting Director"=>"44",
"Censor"=>"45",
"Chartered Accountant"=>"46",
"Chief Assistant Action Director"=>"47",
"Chief Assistant Choreographer"=>"48",
"Chief Assistant Cinematographer"=>"49",
"Chief Assistant Director"=>"50",
"Chief Assistant Editor"=>"51",
"Chief Assistant Sound Designer"=>"52",
"Chief Of Production"=>"53",
"Choreographer"=>"54",
"Cinematographer"=>"55",
"Co-Producer"=>"56",
"Colorist"=>"57",
"Costume Coordinator"=>"58",
"Costume Designer"=>"59",
"Costumes"=>"60",
"Crane Operators"=>"61",
"Creative Director"=>"62",
"Creative Producer"=>"63",
"Crew"=>"64",
"Dialogue Writer"=>"65",
"Dialogues"=>"66",
"Digital Intermediate"=>"67",
"Director"=>"68",
"Director of Photography"=>"69",
"Dressman"=>"70",
"Dubbing and Foley Studio"=>"71",
"Editor"=>"72",
"Executive Producer"=>"73",
"Film Scanning Operator"=>"74",
"Film Scanning Supervisor"=>"75",
"First Assistant Cinematographer"=>"76",
"First Assistant Director"=>"77",
"Foley Artist"=>"78",
"Fous Puller"=>"79",
"Gaffer"=>"80",
"Hair Designer"=>"81",
"Internet Campaign"=>"82",
"Jimmy Jib Operators"=>"83",
"Lab"=>"84",
"Legal Advisor"=>"85",
"Line Producer"=>"86",
"Lyricist"=>"87",
"Make-up"=>"88",
"Make-up Designer"=>"89",
"Marketing"=>"90",
"Marketing and Promotions"=>"91",
"Media Relations"=>"92",
"Mixing Engineer"=>"93",
"Modelers"=>"94",
"Music Company"=>"95",
"Music Director"=>"96",
"Music by"=>"97",
"Negative Editor"=>"98",
"On Air Promos"=>"99",
"Playback Singer"=>"100",
"Presenter"=>"101",
"Producer"=>"102",
"Production Co-Ordinator"=>"103",
"Production Controller"=>"104",
"Production Designer"=>"105",
"Production Executive"=>"106",
"Production Executives"=>"107",
"Production Manager"=>"108",
"Publicity Campaign"=>"109",
"Publicity Consultant"=>"110",
"Publicity Designer"=>"111",
"Publicity Printer"=>"112",
"Re-Recording Assistant"=>"113",
"Re-Recording Engineer"=>"114",
"Recording"=>"115",
"Recordist Mixer"=>"116",
"Screenplay"=>"117",
"Screenplay Writer"=>"118",
"Script Consultant"=>"119",
"Script Supervisor & Continuity"=>"120",
"Second Assistant Cinematographer"=>"121",
"Second Assistant Director"=>"122",
"Singer"=>"123",
"Song Director"=>"124",
"Song Recording Engineer"=>"125",
"Sound Attendants"=>"126",
"Sound Designer"=>"127",
"Sound Post Production"=>"128",
"Special Appearance"=>"129",
"Special Stills"=>"130",
"Steadicam Operators"=>"131",
"Still Photographer"=>"132",
"Story"=>"133",
"Story Writer"=>"134",
"Storyboard"=>"135",
"Supervising Producer"=>"136",
"Supporting Actress"=>"137",
"Sync Sound"=>"138",
"Thrills"=>"139",
"Visual Effects"=>"140",
"Visual Effects Supervisor"=>"141",
"Website Design"=>"142",
"Writer"=>"143"
}


f1 = File.new("#{ARGV[0]}","r")
f2 = File.new("#{ARGV[1]}","r")
f3 = File.new("#{ARGV[2]}","r")

d1 = f1.read
d2 = f2.read
d3 = f3.read


ar = JSON.parse(d1)
movie = JSON.parse(d2)
artist = JSON.parse(d3)


ar.each do |a|
 a_id = a['id']
 a['movies'].each do |m|
  m_id = m['id']
  m['role'].each do |r|
     mid =  movie[m_id]
     aid =  artist[a_id]
     rid =  roles[r]
	 
	 #puts "ARTIST:" + a['id'] if(aid == nil)
	 #puts "Movie:" + m['id'] if(mid == nil)
	 #puts "Role:" + r if(rid == nil)
	 
	 puts '(' + mid + ',' + aid + ',' + rid + '),' unless (aid == nil || mid == nil || rid == nil)
  end
 end 
end

