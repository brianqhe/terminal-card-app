module Punishments

    # Method to display a table of the current punishments
    def display_punishments(hash)
        puts "\nThe current list of punishments are -\n"
        rows = []
        hash.each {|key,value| rows << [key,value]}
        table = Terminal::Table.new :headings=> ['Punishment', 'Amount'], :rows => rows
        puts table
        puts "\n"
    end

    # Method to select a random punishment
    def random_punshiment(hash)
        chosen_punishment = hash.keys.sample()
        "The punishment they have to perform is to do #{chosen_punishment} for #{hash[chosen_punishment]} repetitions"
    end

end
