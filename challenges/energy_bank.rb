require 'pry'
def result
  cities = gets.chomp.to_i
  energy_supplies = gets.chomp.split('').map { |i|  i.to_i }
  sum = 0
  sum = energy_supplies.reduce{|sum, i| sum + i}
  supply_diffs = {}
  energy_supplies.each_with_index do | supply, index|
    supply_diffs[sum - supply] = index+1 
  end

  p supply_diffs.keys.min

end


result