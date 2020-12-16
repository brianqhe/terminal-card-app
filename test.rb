scoreboard = {'Brian' => 5, 'Sam' => 100, 'Nathan' => 100, 'Peter' => 10}


maximum = scoreboard.values.max
count = scoreboard.values.count(maximum)

if count > 1
    losers = scoreboard.select {|key,value| value >= maximum}
    losers.each {|k,v| puts "#{k} took #{v} turns to complete the game..."}
    puts "Unfortunately they'll have to do the punishment..."
else
    puts "The person who took the most number of turns was #{scoreboard.key(maximum)}"
end

puts count
puts maximum
puts scoreboard.key(maximum)