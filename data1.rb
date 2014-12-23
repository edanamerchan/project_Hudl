#!/usr/bin/env ruby

require "csv"

#Create hash tables
points_cup = Hash.new(0)
gf_cup = Hash.new(0)
ga_cup = Hash.new(0)
number_games = Hash.new{0}

all_cup = {}

points_pre = Hash.new(0)
scores_pre = Hash.new(0)
regions_pre = Hash.new {}
all_pre = {}


edition_prev = 1930

#Open the csv output file
CSV.open("cup_stats_full.csv", "wb") do |csv|
	csv << ["country", "points", "gf","ga","editions","region"]

#Read and process the input csv file
CSV.foreach('./matches_full.csv',:headers => true, :col_sep => ',') do |row|
	#For non empty rows
	if row[1]
		edition = row[1].to_s
		edition = edition.split('-')
		edition = edition[0].to_i
	else
		edition = ""
	end

	#Count the number of participations	
	next unless row[0]

	# Read the score string and split it
	round = row[2].to_s
	score = row[3].to_s
	score = score.split(' ')[0].split('-')

	#Read the team name
	team1_score = score[0].to_i
	team2_score = score[1].to_i

	team1_points = team2_points = 0

	if team1_score > team2_score
		team1_points = 3
	elsif team1_score < team2_score
		team2_points = 3
	else
		team2_points = team1_points = 1
	end

	team1 = row[4].to_s
	team1 = team1.split('(')[0].strip
	team2 = row[5].to_s
	team2 = team2.split('(')[0].strip

	#Split between preliminary rounds and cup games
	if round.include? "PRELIMINARY"

		points_pre[team1] = points_pre[team1]+team1_points
		points_pre[team2] = points_pre[team2]+team2_points

		scores_pre[team1] = scores_pre[team1]+team1_score
		scores_pre[team2] = scores_pre[team2]+team1_score

		regions_pre[team1] = round.split('-')[1]
		regions_pre[team2] = round.split('-')[1]

	else	
		number_games["#{team1};#{edition}"] = number_games["#{team1};#{edition}"] + 1 
		number_games["#{team2};#{edition}"] = number_games["#{team2};#{edition}"] + 1 

		points_cup[team1] = points_cup[team1]+team1_points
		points_cup[team2] = points_cup[team2]+team2_points

		gf_cup[team1] = gf_cup[team1]+team1_score	
		gf_cup[team2] = gf_cup[team2]+team2_score

		ga_cup[team1] = ga_cup[team1]+team2_score	
		ga_cup[team2] = ga_cup[team2]+team1_score
	end
end

#Put toguether the team, points and scores
#For the preliminary round table
points_pre.each do |team, point|
	all_pre[team] =  [point]
end

scores_pre.each do |team, score|
	all_pre[team] << score
end

#For the cup round table
points_cup.each do |team, point|
	all_cup[team] =  [point]
end

gf_cup.each do |team, score|
	all_cup[team] << score
end

ga_cup.each do |team, score|
	all_cup[team] << score
end

counts = Hash.new(0)
number_games.each do |team, number|
	year = team.split(';')
	name = year[0].to_s
	year = year[1].to_s
	counts[name] =  counts[name] + 1
end

counts.each do |team, number|
	all_cup[team] << number
end

regions_pre.each do |team, region|
	all_cup[team] << region if all_cup[team]
end

all_cup.each do |team, a|
	#puts "#{team} #{a[0]} #{a[1]} #{a[2]} #{a[3]} #{a[4]}"
	csv << ["#{team}","#{a[0]}","#{a[1]}","#{a[2]}","#{a[3]}","#{a[4]}"]
end
end
