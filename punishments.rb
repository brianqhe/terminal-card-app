module Punishments
    @punishments = ["do 10 pushups", "do 20 star jumps", "do 10 sit ups", "do 5 squat jumps"]

    def display_punishments()
        puts "\nThe current list of punishments are -"
        @punishments.each {|x| puts "\t #{x.capitalize}"}
    end

    def random_punshiment()
        puts "The random punishment that was selected is... #{@punishments.sample}"
    end

end
