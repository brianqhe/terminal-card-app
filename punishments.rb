module Punishments

    def display_punishments(array)
        puts "\nThe current list of punishments are -"
        array.each {|x| puts "\t #{x.capitalize}"}
    end

    def random_punshiment(array)
        array.sample
    end

    def selected_punishment(array)
        puts "The random punishment that was selected is... #{array.sample}"
    end
end
