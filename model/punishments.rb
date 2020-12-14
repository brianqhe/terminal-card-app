module Punishments

    def display_punishments(array)
        puts "\nThe current list of punishments are -\n"
        array.each {|x| puts "\t #{x.capitalize}"}
        puts "\n"
    end

    def random_punshiment(array)
        "The punishment they have to perform is #{array.sample}"
    end

    def selected_punishment(array)
        puts "The random punishment that was selected is... #{array.sample}"
    end
end
