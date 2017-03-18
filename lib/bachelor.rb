def get_first_name_of_season_winner(data, season)
	winner_first_name = ""
	data.each do |season_number, contestant_array|
		if season_number == season
			contestant_array.each do |element|
				element.each do |key, value|
					if element.values.include?("Winner")
						if key == "name"
							winner_first_name = value.split(" ")[0]
						end
					end
				end
			end
		end
	end
	winner_first_name
end

def get_contestant_name(data, occupation)
	contestant_name = ""
	data.each do |season_number, contestant_array|
		contestant_array.each do |element|
			element.each do |key, value|
				if element.values.include?(occupation)
					if key == "name"
						contestant_name = value
					end
				end
			end
		end
	end
	contestant_name
end

def count_contestants_by_hometown(data, hometown)
	count = 0
	data.each do |season_number, contestant_array|
		contestant_array.each do |element|
			element.each do |key, value|
				if key == "hometown" && value == hometown
					count +=1
				end
			end
		end
	end
	count
end

def get_occupation(data, hometown)
	occupation = ""
	count = 0
	data.each do |season_number, contestant_array|
		contestant_array.each do |element|
			element.find do |key, value|
				if element.values.include?(hometown) && count < 1
					if key == "occupation"
						occupation = value
						count +=1
					end
				end
			end
		end
	end
	occupation
end

def get_average_age_for_season(data, season)
	average_age = 0
	ages_array =[]
	data.each do |season_number, contestant_array|
		if season_number == season
			contestant_array.each do |element|
				element.each do |key, value|
					if key == "age"
						ages_array << value.to_f
					end
				end
			end
		end
	end
	ages_array.each do |age|
		average_age += age
	end
	average_age = (average_age/ages_array.size).round
	average_age
end