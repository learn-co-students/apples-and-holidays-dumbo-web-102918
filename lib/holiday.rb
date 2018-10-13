require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
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
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  
  
  holiday_hash[:winter][:christmas] += [supply]
  holiday_hash[:winter][:new_years] += [supply]

end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] += [supply]

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  
  prev = holiday_hash[season].to_a
  holiday_hash[season] = {holiday_name => supply_array}
  new_hash  = prev += holiday_hash[season].to_a
  new_hash = new_hash.to_h
  holiday_hash[season] = new_hash
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  result = []
  holiday_hash[:winter].each do |k,v|
    result += v
  end
  result
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
    holiday_hash.each do |hash, values|
      hash = hash.capitalize
       puts "#{hash}:"
       values.each_with_index do |val, idx|
          supply = val.pop
          supply = supply.join(", ")
          string = val.pop
          string = string.to_s.gsub("_", " ")
          result = string.split(" ").map{|word|word.capitalize}.join(" ")
          puts "  #{result}: #{supply}"
       end
    end

end

def all_holidays_with_bbq(holiday_hash)
  temp = []
  holiday_hash.values.each_with_index do |values, idx|
    values.each do |k, v|
       temp << holiday_hash.values[idx] if v.include?("BBQ")
    end
  end
  result = []
  temp.each{|hash|hash.each{|k,v| result << k}}
  result
end







