module Game
    @counter = 0
    @scoreboard = {}


    def game_start()
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
        
        puts "tell me your name"
        name = gets.chomp.capitalize()
    
        while game == true
            while level_1 == true
                card_number = card_values.keys.sample.to_s
                suit = suits_symbols.sample.to_s
                card = [["┌───────────┐"],["│ #{card_number}         │"],["│           │"],["│           │"],["│     #{suit}     │"],["│           │"],["│           │"],["│         #{card_number} │"],["└───────────┘"],]
                puts facedown_card
                puts "Guess whether the card is red or black"
                guess = gets.chomp.capitalize
                if guess == symbol_colour[suit]
                    puts card
                    puts "\nCorrect!"
                    level_1 = false
                    level_2 = true
                    next
                else
                    puts card
                    puts "\nIncorrect..."
                    @counter += 1
                end
            end
            while level_2 == true
                random_number2 = card_values.keys.sample.to_s
                random_suit2 = suits_symbols.sample.to_s
                card2 = [["┌───────────┐"],["│ #{random_number2}         │"],["│           │"],["│           │"],["│     #{random_suit2}     │"],["│           │"],["│           │"],["│         #{random_number2} │"],["└───────────┘"],]
                puts "Guess whether your next card is higher or lower"
                higher_or_lower = gets.chomp
                if higher_or_lower == "higher" && ((card_values[random_number2.to_s].to_i > card_values[card_number.to_s].to_i) == true)
                    puts card2
                    puts "\nCorrect!"
                    level_2 = false
                    level_3 = true
                    next
                elsif higher_or_lower == "lower" && ((card_values[random_number2.to_s].to_i < card_values[card_number.to_s].to_i) == true)
                    puts card2
                    puts "\nCorrect!"
                    level_2 = false
                    level_3 = true
                    next
                else
                    puts card2
                    puts "\nIncorrect..."
                    level_2 = false
                    level_1 = true
                    level_3 = false
                    @counter += 1
                end
            end
            while level_3 == true
                random_number3 = card_values.keys.sample.to_s
                random_suit3 = suits_symbols.sample.to_s
                if random_number2 < card_number
                    temporary = random_number2
                    random_number2 = card_number
                    card_number = temporary
                end
                card3 = [["┌───────────┐"],["│ #{random_number3}         │"],["│           │"],["│           │"],["│     #{random_suit3}     │"],["│           │"],["│           │"],["│         #{random_number3} │"],["└───────────┘"],]
                puts "Guess whether your next card is inside or outside your previous two cards"            
                inside_or_outside = gets.chomp
                inside = card_values[random_number3.to_s].to_i > card_values[card_number.to_s].to_i && card_values[random_number3.to_s].to_i < card_values[random_number2.to_s].to_i
                outside = card_values[random_number3.to_s].to_i < card_values[card_number.to_s].to_i || card_values[random_number3.to_s].to_i > card_values[random_number2.to_s].to_i
                if inside_or_outside == "inside" && inside
                    puts card3
                    puts "\nCorrect!"
                    level_3 = false
                    level_4 = true
                    next
                elsif inside_or_outside == "outside" && outside
                    puts card3
                    puts "\nCorrect!"
                    level_3 = false
                    level_4 = true
                    next
                else
                    puts card3
                    puts "\nIncorrect..."
                    level_3 = false
                    level_4 = false
                    level_1 = true
                    @counter += 1
                end 
            end
            while level_4 == true
                random_number4 = card_values.keys.sample.to_s
                random_suit4 = suits_symbols.sample.to_s
                card4 = [["┌───────────┐"],["│ #{random_number4}         │"],["│           │"],["│           │"],["│     #{random_suit4}     │"],["│           │"],["│           │"],["│         #{random_number4} │"],["└───────────┘"],]
                puts "Guess what suit your next card will be (spades, clubs, hearts, diamonds)"            
                what_suit = gets.chomp
                if what_suit == "spades" && random_suit4 == "♠"
                    puts card4
                    puts "\nCorrect!"
                    puts "Congratulations! You've won the game!"
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
                    puts "Congratulations! You've won the game!"
                    level_4 = false
                    play_again = true
                    @counter +=1
                    @scoreboard[name] = @counter
                    puts @hash
                    @counter = 0
                    next
                elsif what_suit == "clubs" && random_suit4 == "♣"
                    puts card4
                    puts "\nCorrect!"
                    puts "Congratulations! You've won the game!"
                    level_4 = false
                    play_again = true
                    @counter +=1
                    @scoreboard[name] = @counter
                    puts @hash
                    @counter = 0
                    next
                elsif what_suit == "diamonds" && random_suit4 == "♦"
                    puts card4
                    puts "\nCorrect!"
                    puts "Congratulations! You've won the game!"
                    level_4 = false
                    play_again = true
                    @counter +=1
                    @scoreboard[name] = @counter
                    puts @hash
                    @counter = 0
                    next
                else
                    puts card4
                    puts "\nIncorrect..."
                    level_4 = false
                    level_1 = true
                    @counter += 1
                end 
            end
            while play_again == true
                puts "would you like to play again? (y/n)"
                again = gets.chomp()
                    if again == "y"
                        level_1 = true
                        play_again = false
                        puts "tell me your name"
                        name = gets.chomp()
                        game = true
                    else
                        puts "thanks for playing!"
                        play_again = false
                        game = false
                    end
            end
        end
    end

    def display_scores()
        puts @scoreboard
    end

    def display_lowest()
        if @scoreboard.empty?
            puts "The scoreboard is currently empty..."
        else
            maximum = @scoreboard.values.max
            puts "The person who took the most number of turns was #{@scoreboard.key(maximum)}"
        end
    end

end