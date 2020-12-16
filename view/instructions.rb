module Instructions
    def instructions()
        system("clear")
        a = Artii::Base.new 
        puts a.asciify("Instructions").colorize(:light_green)
        instructions_values = {
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
            "K"=> 13,
            "A" => 14
        }
        instructions_symbols = {"♠" => 'Black', "♦" => 'Red', "♥" => 'Red', "♣" => 'Black'}
        facedown_card = [["┌───────────┐"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["└───────────┘"]]
        card1 = [["┌───────────┐"],["│ 4         │"],["│           │"],["│           │"],["│     ♠     │"],["│           │"],["│           │"],["│         4 │"],["└───────────┘"],]
        card2 = [["┌───────────┐"],["│ 9         │"],["│           │"],["│           │"],["│     #{"♥".colorize(:red)}     │"],["│           │"],["│           │"],["│         9 │"],["└───────────┘"],]
        card3 = [["┌───────────┐"],["│ 5         │"],["│           │"],["│           │"],["│     ♣     │"],["│           │"],["│           │"],["│         5 │"],["└───────────┘"],]
        card4 = [["┌───────────┐"],["│ Q         │"],["│           │"],["│           │"],["│     #{"♥".colorize(:red)}     │"],["│           │"],["│           │"],["│         Q │"],["└───────────┘"],]
        puts "This game comprises of 4 levels"
        puts "You can only progress to the next level if you guess right, otherwise you start again!"
        puts a.asciify("Level 1").colorize(:light_cyan)
        puts "Guess whether the card revealed will be black or red"
        puts facedown_card
        puts "\n"
        puts card1
        puts a.asciify("Level 2").colorize(:light_cyan)
        puts "Guess whether the next card revealed will be higher or lower your first card"
        puts "NOTE: If it's the same you automatically lose... (Goalpost rule)"
        puts card2
        puts a.asciify("Level 3").colorize(:light_cyan)
        puts "Guess whether the next card is inside or outside of the range of the previous two card"
        puts card3
        puts "In the example above, 5 is inside the range of 4 and 9, therefore a correct guess of 'inside' will make you correct"
        puts "NOTE: If the card is the same as any of your previous two cards, you automatically lose! (Goalpost rule)"
        puts a.asciify("Level 4").colorize(:light_cyan)
        puts card4
        puts "Guess the suit of your last card"
        puts "The player who takes the least amount of turns to RIDE THE BUS wins!"

        puts a.asciify("Card Values").colorize(:light_cyan)
        puts "Here are the values of the cards for this game!"

        rows1 = []
        instructions_values.each {|key,value| rows1 << [key,value]}
        table1 = Terminal::Table.new :headings=> ['Card', 'Value'], :rows => rows1
        puts table1

        puts a.asciify("Suit Colors").colorize(:light_cyan)
        puts "Here are the colours of the suits!"
        rows2 = []
        instructions_symbols.each {|key,value| rows2 << [key,value]}
        table2 = Terminal::Table.new :headings=> ['Suit', 'Colour'], :rows => rows2
        puts table2

        puts "\nGood luck!"
    end

    def help()
        puts "These are the help instructions - "
    end
end