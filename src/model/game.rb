require 'colorize'
require 'artii'
require 'tty-prompt'
require 'terminal-table'

module Game
    # Instance variables for scoreboard
    @counter = 1
    @scoreboard = {}

    # Method to select a random suit
    def self.random_suit(array)
        array.sample
    end

    # Method to select a random card number
    def self.random_key(hash)
        hash.keys.sample.to_s
    end

    # Method to start the game
    def game_start()
        system("clear")
        prompt = TTY::Prompt.new
        a = Artii::Base.new 
        puts a.asciify("Game Start !").colorize(:light_blue)

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
        
        suits_name = ["Spades", "Diamonds", "Hearts", "Clubs"]
        suits_symbols = ["♠", "♦", "♥", "♣"]
        colors = ["Red", "Black"]
        suits_hash = {"Spades" => 'Black', "Diamonds" => "Red", "Hearts" => "Red", "Clubs" => "Black"}
        suits_symbol = {"Spades" => "♠", "Diamonds" => "♦", "Hearts" => "♥", "Clubs" => "♣"}
        symbol_colour = {"♠" => "Black", "♦" => "Red", "♥" => "Red", "♣" => "Black" }
        
        facedown_card = [["┌───────────┐"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["└───────────┘"]]
        
        
        game = true
        level_1 = true
        level_2 = false
        level_3 = false
        level_4 = false
        play_again = false
        
        # Promot to enter your name
        print "Enter your name: ".colorize(:blue)
        name = gets.chomp.capitalize()
    
        # Loop for game
        while game == true
            # Loop for level 1
            while level_1 == true
                puts a.asciify("Level 1").colorize(:light_cyan)
                card_number = random_key(card_values)
                suit = random_suit(suits_symbols)
                if card_number.length > 1
                    card = [["┌───────────┐"],["│ #{card_number}        │"],["│           │"],["│           │"],["│     #{suit}     │"],["│           │"],["│           │"],["│        #{card_number} │"],["└───────────┘"],]
                else
                    card = [["┌───────────┐"],["│ #{card_number}         │"],["│           │"],["│           │"],["│     #{suit}     │"],["│           │"],["│           │"],["│         #{card_number} │"],["└───────────┘"],]
                end
                puts facedown_card
                level1_options = {Red: 'Red', Black: 'Black', Quit: 'Quit'}
                red_or_black = prompt.select("Red or black?".colorize(:blue), level1_options)
                if red_or_black == symbol_colour[suit]
                    puts card
                    puts "\nCorrect!".colorize(:green)
                    level_1 = false
                    level_2 = true
                    next
                elsif red_or_black == 'Quit'
                    puts "You have quit the game, your score has been set to automatically 100"
                    level_1 = false
                    play_again = true
                    @counter = 100 
                    @scoreboard[name] = @counter
                    @counter = 0
                else
                    puts card
                    puts "\nIncorrect...".colorize(:red)
                    @counter += 1
                    puts "You have so far taken #{@counter} turns..."
                end
            end
            # Loop for level 2
            while level_2 == true
                puts a.asciify("Level 2").colorize(:light_cyan)
                random_number2 = random_key(card_values)
                random_suit2 = random_suit(suits_symbols)
                if random_number2.length > 1
                    card2 = [["┌───────────┐"],["│ #{random_number2}        │"],["│           │"],["│           │"],["│     #{random_suit2}     │"],["│           │"],["│           │"],["│        #{random_number2} │"],["└───────────┘"],]
                else
                    card2 = [["┌───────────┐"],["│ #{random_number2}         │"],["│           │"],["│           │"],["│     #{random_suit2}     │"],["│           │"],["│           │"],["│         #{random_number2} │"],["└───────────┘"],]
                end
                level2_options = {Higher: 'higher', Lower: 'lower', Quit: 'Quit'}
                higher_or_lower = prompt.select("Higher or Lower?".colorize(:blue), level2_options)
                if higher_or_lower == "higher" && ((card_values[random_number2.to_s].to_i > card_values[card_number.to_s].to_i) == true)
                    puts card2
                    puts "\nCorrect!".colorize(:green)
                    level_2 = false
                    level_3 = true
                    next
                elsif higher_or_lower == "lower" && ((card_values[random_number2.to_s].to_i < card_values[card_number.to_s].to_i) == true)
                    puts card2
                    puts "\nCorrect!".colorize(:green)
                    level_2 = false
                    level_3 = true
                    next
                elsif higher_or_lower == 'Quit'
                    puts "You have quit the game, your score has been set to automatically 100"
                    level_2 = false
                    play_again = true
                    @counter = 100 
                    @scoreboard[name] = @counter
                    @counter = 0
                else
                    puts card2
                    puts "\nIncorrect...".colorize(:red)
                    level_2 = false
                    level_1 = true
                    level_3 = false
                    @counter += 1
                    puts "You have so far taken #{@counter} turns..."
                end
            end
            # Loop for level 3
            while level_3 == true
                puts a.asciify("Level 3").colorize(:light_cyan)
                random_number3 = card_values.keys.sample.to_s
                random_suit3 = suits_symbols.sample.to_s
                if random_number2 < card_number
                    temporary = random_number2
                    random_number2 = card_number
                    card_number = temporary
                end
                if random_number3.length > 1
                    card3 = [["┌───────────┐"],["│ #{random_number3}        │"],["│           │"],["│           │"],["│     #{random_suit3}     │"],["│           │"],["│           │"],["│        #{random_number3} │"],["└───────────┘"],]
                else
                    card3 = [["┌───────────┐"],["│ #{random_number3}         │"],["│           │"],["│           │"],["│     #{random_suit3}     │"],["│           │"],["│           │"],["│         #{random_number3} │"],["└───────────┘"],]
                end
                level3_options = {Inside: 'inside', Outside: 'outside', Quit: 'Quit'}
                inside_or_outside = prompt.select("Inside or Outside?".colorize(:blue), level3_options)
                inside = card_values[random_number3.to_s].to_i > card_values[card_number.to_s].to_i && card_values[random_number3.to_s].to_i < card_values[random_number2.to_s].to_i
                outside = card_values[random_number3.to_s].to_i < card_values[card_number.to_s].to_i || card_values[random_number3.to_s].to_i > card_values[random_number2.to_s].to_i
                if inside_or_outside == "inside" && inside
                    puts card3
                    puts "\nCorrect!".colorize(:green)
                    level_3 = false
                    level_4 = true
                    next
                elsif inside_or_outside == "outside" && outside
                    puts card3
                    puts "\nCorrect!".colorize(:green)
                    level_3 = false
                    level_4 = true
                    next
                elsif inside_or_outside == 'Quit'
                    puts "You have quit the game, your score has been set to automatically 100"
                    level_3 = false
                    play_again = true
                    @counter = 100 
                    @scoreboard[name] = @counter
                    @counter = 0
                else
                    puts card3
                    puts "\nIncorrect...".colorize(:red)
                    level_3 = false
                    level_4 = false
                    level_1 = true
                    @counter += 1
                    puts "You have so far taken #{@counter} turns..."
                end 
            end
            # Loop for level 4
            while level_4 == true
                puts a.asciify("Level 4").colorize(:light_cyan)
                random_number4 = card_values.keys.sample.to_s
                random_suit4 = suits_symbols.sample.to_s
                if random_number4.length > 1
                    card4 = [["┌───────────┐"],["│ #{random_number4}        │"],["│           │"],["│           │"],["│     #{random_suit4}     │"],["│           │"],["│           │"],["│        #{random_number4} │"],["└───────────┘"],]
                else
                    card4 = [["┌───────────┐"],["│ #{random_number4}         │"],["│           │"],["│           │"],["│     #{random_suit4}     │"],["│           │"],["│           │"],["│         #{random_number4} │"],["└───────────┘"],]
                end
                level4_options = {Spades: 'spades', Hearts: 'hearts', Clubs: 'clubs', Diamonds: 'diamonds', Quit: 'Quit'}
                what_suit = prompt.select("Suit?".colorize(:blue), level4_options)
                if what_suit == "spades" && random_suit4 == "♠"
                    puts card4
                    puts "\nCorrect!".colorize(:green)
                    puts "Congratulations! You've won the game!".colorize(:green)
                    level_4 = false
                    play_again = true
                    @counter +=1
                    @scoreboard[name] = @counter
                    puts @hash
                    @counter = 0
                    next
                elsif what_suit == "hearts" && random_suit4 == "♥"
                    puts card4
                    puts "\nCorrect!"
                    puts "Congratulations! You've won the game!".colorize(:green)
                    level_4 = false
                    play_again = true
                    @counter +=1
                    @scoreboard[name] = @counter
                    @counter = 0
                    next
                elsif what_suit == "clubs" && random_suit4 == "♣"
                    puts card4
                    puts "\nCorrect!".colorize(:green)
                    puts "Congratulations! You've won the game!".colorize(:green)
                    level_4 = false
                    play_again = true
                    @counter +=1
                    @scoreboard[name] = @counter
                    @counter = 0
                    next
                elsif what_suit == "diamonds" && random_suit4 == "♦"
                    puts card4
                    puts "\nCorrect!".colorize(:green)
                    puts "Congratulations! You've won the game!".colorize(:green)
                    level_4 = false
                    play_again = true
                    @counter +=1
                    @scoreboard[name] = @counter
                    @counter = 0
                    next
                elsif what_suit == 'Quit'
                    puts "You have quit the game, your score has been set to automatically 100"
                    level_4 = false
                    play_again = true
                    @counter = 100 
                    @scoreboard[name] = @counter
                    @counter = 0
                else
                    puts card4
                    puts "\nIncorrect...".colorize(:red)
                    level_4 = false
                    level_1 = true
                    @counter += 1
                    puts "You have so far taken #{@counter} turns..."
                end 
            end
            # Loop to check if user wants to play again
            while play_again == true
                again_options = {Yes: 'y', No: 'n'}
                again = prompt.select("Would you like to play again?".colorize(:blue), again_options)
                    if again == "y"
                        level_1 = true
                        play_again = false
                        print "Enter you name: ".colorize(:blue)
                        name = gets.chomp()
                        game = true
                    else
                        puts "Thanks for playing!"
                        play_again = false
                        game = false
                    end
            end
        end
    end

    # Method to display the scoreboard and an alternate message if empty
    def display_scores()
        if @scoreboard.empty?
            puts "The scoreboard is currently empty...".colorize(:red)
        else
            rows = []
            @scoreboard.each {|key,value| rows << [key,value]}
            table = Terminal::Table.new :headings => ['Player', 'Turns'], :rows => rows
            puts table
        end
    end

    # Method to display the loser of all the players that have played the game, displays multiple losers if highest number of turns is same for people
    def display_lowest()
        if @scoreboard.empty?
            system("clear")
            a = Artii::Base.new 
            puts a.asciify("Judgement Time !").colorize(:magenta)
            puts "The scoreboard is currently empty...".colorize(:red)
        else
            system("clear")
            a = Artii::Base.new 
            puts a.asciify("Judgement Time !").colorize(:magenta)
            maximum = @scoreboard.values.max
            loser_count = @scoreboard.values.count(maximum)
            if loser_count > 1
                losers = @scoreboard.select {|key,value| value >= maximum}
                losers.each {|k,v| puts "#{k.capitalize} took #{v} turns to complete the game..."}
                puts "Unfortunately they'll have to do the punishment..."
            else
                puts "The person who took the most number of turns was #{@scoreboard.key(maximum)}"
            end
        end
    end

end