require_relative 'controller/validator'
require_relative 'model/game'
require_relative 'model/punishments'
require_relative 'view/instructions'
require 'artii'
require 'colorize'
include Punishments
include Game
include Instructions

def gets
    STDIN.gets
end

def display_menu()
    punishments = {'Pushups' => 20, 'Squat jumps' => 30, 'Sit ups' => 50, 'Burpees' => 15}
    if ARGV[0] == '-h' || ARGV[0] == '-help' 
        Instructions.help()
        puts "Press enter to continue".colorize(:blue)
        gets.chomp()
        ARGV.clear
        input = 0
    elsif ARGV[0].to_i > 0 && ARGV[0].to_i < 5 && ARGV.length == 1
        input = ARGV[0]
        ARGV.clear
    elsif ARGV[0].to_i > 4
        puts "You didn't enter a correct menu option between 1 - 5"
        puts "Press enter to continue".colorize(:blue)
        gets.chomp()
        ARGV.clear
    else
        system("clear")
        a = Artii::Base.new 
        puts a.asciify("Ride the Bus !").colorize(:red)
        puts "Welcome to this terminal app of a simple card game\n"
        puts "Please see the menu below - "
        puts "1. Play the game"
        puts "2. Instructions"
        puts "3. Current Scores and Punishments"
        puts "4. Who gets punished?"
        puts "5. Exit Game"
    
        print "\nEnter Number: ".colorize(:blue)
        input = gets.chomp()
        input_valid = Validator.validate_input(input)
        if !input_valid
            puts "Invalid input, please enter a number from 1-5"
            puts "Press enter to continue".colorize(:blue)
            gets
            display_menu()
        end
    end

    case input.to_i
    when 0
        display_menu()
    when 1
        Game.game_start()
        display_menu()
        system("clear")
        puts "Returning to Main Menu..."
    when 2
        Instructions.instructions()
        puts "Press enter to return to main menu...".colorize(:blue)
        gets
        system("clear")
        display_menu()
    when 3
        a = Artii::Base.new 
        puts a.asciify("Hall of Shame !").colorize(:cyan)
        puts "Here are the current the scores"
        Game.display_scores()
        Punishments.display_punishments(punishments)
        puts "Press enter to return to main menu...".colorize(:blue)
        gets
        system("clear")
        display_menu()
    when 4
        puts Game.display_lowest()
        puts Punishments.random_punshiment(punishments)
        puts "\nPress enter to return to main menu...".colorize(:blue)
        gets
        system("clear")
        display_menu()
    when 5
        puts "Goodbye, thanks for playing!"
        exit(0)
    end
end

display_menu()