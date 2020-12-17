module Punishments

    def display_punishments(hash)
        puts "\nThe current list of punishments are -\n"
        rows = []
        hash.each {|key,value| rows << [key,value]}
        table = Terminal::Table.new :headings=> ['Punishment', 'Amount'], :rows => rows
        puts table
        puts "\n"
    end

    def random_punshiment(hash)
        chosen_punishment = hash.keys.sample()
        "The punishment they have to perform is to do #{chosen_punishment} for #{hash[chosen_punishment]} repetitions"
    end

    # def selected_punishment(array)
    #     puts "The random punishment that was selected is... #{array.sample}"
    # end
end
