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


card_values = {
    "A" => 14, 
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5"=> 5,
    "6"=> 6,
    "7"=> 7,
    "8"=> 8,
    "9"=> 9,
    "10"=> 10,
    "J"=> 11,
    "Q"=> 12,
    "K"=> 13
}

suits_symbols = ["♠", "♦", "♥", "♣"]



def random_number(hash)
    hash.keys.sample
end

def random_suit(suits)
    suits.sample
end



rand_1 = random_number(card_values)
rand_2 = random_number(card_values)

puts rand_1
puts rand_2

suit_1 = random_suit(suits_symbols)
suit_2 = random_suit(suits_symbols)

puts suit_1
puts suit_2

puts random_punshiment(punishments)
    