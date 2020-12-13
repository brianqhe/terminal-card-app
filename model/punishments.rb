module Punishments

    def display_punishments(array)
        system("clear")
        a = Artii::Base.new 
        puts a.asciify("Hall of Shame !").colorize(:cyan)
        puts "\nThe current list of punishments are -\n"
        array.each {|x| puts "\t #{x.capitalize}"}
    end

    def random_punshiment(array)
        array.sample
    end

    def selected_punishment(array)
        puts "The random punishment that was selected is... #{array.sample}"
    end
end
