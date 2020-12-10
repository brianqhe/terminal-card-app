require_relative 'validator'
require_relative 'game'
require_relative 'punishments'
include Punishments
include Game

def display_menu()
    system("clear")
    puts "Welcome to your this card game!"
    puts "Please see the menu below"
    puts "1. Play the game"
    puts "2. Instructions"
    puts "3. Current Scores and Punishments"
    puts "4. Who gets punished?"
    puts "5. Exit Game"

    input = gets.chomp()
    input_valid = Validators.validate_input(input)
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
        puts "Returning to Main Menu..."
    when 2
        puts "Here are the instructions - "
    when 3
        puts "Here are the current the scores"
        Game.display_scores()
        Punishments.display_punishments()
        puts "Press enter to return to main menu..."
        gets
        display_menu()
    when 4
        puts Game.display_lowest()
        puts Punishments.random_punshiment()
        puts "Press enter to return to main menu..."
        gets
        display_menu()
    when 5
        puts "Goodbye, thanks for playing!"
        exit(0)
    end
end

display_menu()