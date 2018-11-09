require 'pry'
  # given that holiday_hash looks like this:
  # holiday_hash = {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end


def add_supply_to_winter_holidays(holiday_hash, supply)

  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)


  #   holiday_hash.each do |season, season_info|
  #     if season == :winter
  #       season_info.each do |holiday, holiday_info|
  #         holiday_info.push(supply)
  #       end
  #     end
  #   end
  #  holiday_hash

end
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays




def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
 holiday_hash[season][holiday_name] = supply_array
 #don't need : symbol if variable
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  nested_supplies = holiday_hash[:winter].values
  flat_supplies= nested_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
season = ""
  holiday_hash.each do |season, season_info|
    season = season.to_s.capitalize
    puts "#{season}:"
    #prints this out on separate line
    season_info.each do |holiday, holiday_info|
      holiday_words = holiday.to_s.split("_")
      #turn object into string, then into array so could use each
      holiday_words.each do |word|
        word.capitalize!
        #need bang to capitalize original word first letter in loop
      end
      holiday_words = holiday_words.join(" ")
      #this is now in array so join to put into string
      holiday_info = holiday_info.join(", ")
      # join this one as well
      puts "  #{holiday_words}: #{holiday_info}" #
       #prints this out on separate line, puts put a line inbetween
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_names = []
  holiday_hash.each do |season, season_info|

    season_info.each do |holiday, holiday_info|
      if holiday_info.include?("BBQ")
        holiday_names << holiday
      end
    end
  end
  holiday_names
end
