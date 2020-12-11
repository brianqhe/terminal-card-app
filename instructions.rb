def instructions()
    facedown_card = [["┌───────────┐"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["│░░░░░░░░░░░│"], ["└───────────┘"]]
    card1 = [["┌───────────┐"],["│ 4         │"],["│           │"],["│           │"],["│     ♠     │"],["│           │"],["│           │"],["│         4 │"],["└───────────┘"],]
    card2 = [["┌───────────┐"],["│ 9         │"],["│           │"],["│           │"],["│     ♥     │"],["│           │"],["│           │"],["│         9 │"],["└───────────┘"],]
    card3 = [["┌───────────┐"],["│ 5         │"],["│           │"],["│           │"],["│     ♣     │"],["│           │"],["│           │"],["│         5 │"],["└───────────┘"],]
    card4 = [["┌───────────┐"],["│ Q         │"],["│           │"],["│           │"],["│     ♥     │"],["│           │"],["│           │"],["│         Q │"],["└───────────┘"],]
    puts "\nHere are the instructions to the game\n
    This game comprises of 4 levels\n
    Level 1 will require you to guess whether the card revealed will be black or red\n"
    puts facedown_card
    puts "You will then type 'black' or 'red' when prompted to make your guess\n"
    puts card1
    puts "If correct you will proceed to Level 2, otherwise you will be forced to try again\n
    Level 2 will require you to guess whether the next card revealed will be higher or lower than the first card you guess correctly on Level 1\n
    "
    puts card2
    puts "\tYou will then type 'higher' or 'lower' when prompted to make your guess\n
    If correct, you will proceed to Level 3, otherwise you will have to restart at Level 1\n
    NOTE: If the next card is the same number as your previous card, you automatically lose!\n\n
    Level 3 will require you to guess whether the next card is inside or outside of the range of the previous two card\n
    "
    puts card3
    puts "In the example above, 5 is inside the range of 4 and 9, therefore a correct guess of 'inside' will make you correct\n
    If correct, you will proceed to Level 4, otherwise you will have to restart at Level 1\n
    NOTE: If the card is the same as any of your previous two cards, you automatically lose!\n\n
    Finally, Level 4 will require you to guess the suit of the final card that appears\n
    When prompted, you will type 'spades', 'hearts', 'clubs' or 'clubs' depending on your guess. \n"
    puts card4
    puts "Similar to all the other levels, if correct you will WIN THE GAME, if incorrect, you will have to restart at Level 1\n
    The player who takes the least amount of turns to RIDE THE BUS wins!
    HAPPY PLAYING!"
end