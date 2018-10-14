require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)

  holiday_hash.each do |season, supplies|
    supplies.each do |holiday, sup_list|
      if holiday == :fourth_of_july
        return sup_list.at(1)
      end

    end
  end
end

  # given that holiday_hash looks like this:
  # h = {
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



def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holiday_name_supplies|
    if season == :winter
      holiday_name_supplies.each do |holiday, sup|
          sup << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday_name_supplies|
    if season == :spring
      holiday_name_supplies.each do |holiday, sup|
        if holiday == :memorial_day
          sup << supply
        end
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
    supplies =[]
    holiday_hash.each do |season, holidays |
      if season == :winter
        holidays.each do |holiday, sups|
          supplies += sups
        end
      end
    end
  supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays |
    puts "#{season.to_s.capitalize}:"
    holidays.each do |holiday, supplies|
      formatted_holiday = []
      j=0
      holiday.to_s.each_char.with_index do |ch, i|

        if ch == '_'
          formatted_holiday << holiday[j...i].capitalize
          j=i+1
        end

        if i == holiday.size-1
          formatted_holiday << holiday[j..i].capitalize
        end
      end

      puts "  #{formatted_holiday.join(" ")}: #{supplies.join(', ')}"
    end
  end
end
# all_supplies_in_holidays(h)

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq=[]
  holiday_hash.each do |season, holiday_name_supplies|
      holiday_name_supplies.each do |holiday, sup|
        if sup.include?("BBQ")
          bbq << holiday
        end
      end

  end
  bbq
end
