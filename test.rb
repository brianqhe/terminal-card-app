require 'terminal-table'

punishments = {'Pushups' => 20, 'Squat jumps' => 30, 'Sit ups' => 50, 'Burpees' => 15}
rows = []

punishments.each {|key,value| rows << [key,value]}
table = Terminal::Table.new :headings=> ['Punishment', 'Amount'], :rows => rows

puts table