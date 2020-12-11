require_relative 'validator'
require_relative 'game'
require_relative 'punishments'
require_relative 'instructions'
require 'artii'
require 'colorize'
include Punishments
include Game

def display_menu()
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
        puts "Press enter to continue"
        gets
        display_menu()
    end

    case input.to_i
    when 1
        Game.game_start()
        display_menu()
        system("clear")
        puts "Returning to Main Menu..."
    when 2
        instructions()
        puts "Press enter to return to main menu..."
        gets
        system("clear")
        display_menu()
    when 3
        puts "Here are the current the scores"
        Game.display_scores()
        punishments = ["do 10 pushups", "do 20 star jumps", "do 10 sit ups", "do 5 squat jumps"]
        Punishments.display_punishments(punishments)
        puts "Press enter to return to main menu..."
        gets
        system("clear")
        display_menu()
    when 4
        puts Game.display_lowest()
        punishments = ["do 10 pushups", "do 20 star jumps", "do 10 sit ups", "do 5 squat jumps"]
        puts Punishments.random_punshiment(punishments)
        puts "Press enter to return to main menu..."
        gets
        system("clear")
        display_menu()
    when 5
        puts "Goodbye, thanks for playing!"
        exit(0)
    end
end

display_menu()