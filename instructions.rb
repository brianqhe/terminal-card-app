def instructions()
    system("clear")
    a = Artii::Base.new 
    puts a.asciify("Instructions").colorize(:light_green)
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
    puts "Good luck!"
end