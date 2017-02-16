class RockPaperScissors
    def valid_selection( selection )
        if selection == 'R'
            return true
        elsif selection == 'P'
            return true
        elsif selection == 'S'
            return true
        else
            return false
        end    
    end

    def move_selection
        move_num = rand(3)
        if move_num == 0
            return "Rock"
        elsif move_num == 1
            return "Paper"
        else
            return "Scissors"
        end
    end

    def find_winner(player1_move, computer_move)
        @player1 = player1_move
        @com_move = computer_move
        if @com_move == "Rock" && @player1 == "R"
            return "It was a tie game."
        elsif @com_move == "Rock" && @player1 == "P"
            return "You win!"
        elsif @com_move == "Rock" && @player1 == "S"
            return "You lose. Sorry."
        elsif @com_move == "Paper" && @player1 == "R"
            return "You lose. Sorry."
        elsif @com_move == "Paper" && @player1 == "P"
            return "It was a tie game."
        elsif @com_move == "Paper" && @player1 == "S"
            return "You win!"
        elsif @com_move == "Scissors" && @player1 == "R"
            return "You win!"
        elsif @com_move == "Scissors" && @player1 == "P"
            return "You lose. Sorry."
        else @com_move == "Scissors" && @player1 == "S"
            return "It was a tie game."
        end
    end
end

#Program asks if user wants to play. If yes, begin, if no, exit, if other, ask again.
initiate_game_loop = true
puts "Hello! Do you want to play a game with me? Enter Yes (Y) or No (N)"
initiate_game = gets.chomp.upcase
while initiate_game_loop == true
    #If user selects NO, exit game.
    if initiate_game == "N" 
        puts "OK, Bye"
        initiate_game_loop = false
        break
    #If user selects YES, begin game.
    elsif initiate_game == "Y"
        puts "OK, We're totally going to play a game together." 
        play = RockPaperScissors.new 
        #Program allows user to enter move (Rock, Paper, or Scissors). If other, ask again.
        puts "On the count of three, select rock (R), paper (P), or scissors (S)\n1...\n2...\n3...\nGo!"
        player1_move = gets.chomp.upcase
            if play.valid_selection(player1_move) == true
                #Program randomly chooses its own move (Rock, Paper, or Scissors).
                computer_move = play.move_selection
                puts "The computer chose #{computer_move}."
                #Program tells user what moves were selected and who won.
                game_result = play.find_winner(player1_move, computer_move)
                puts game_result
                #Program asks if user wants to play again. If yes, begin, if no, exit, if other, ask again.
                puts "Do you want to play again? Enter Yes (Y) or No (N)"
                initiate_game = gets.chomp.upcase
                if initiate_game == "Y" 
                    initiate_game_loop = true
                else
                    puts "OK, Bye"
                    initiate_game_loop = false
                    break                    
                end
            else
                puts "That was NOT an appropriate hand gesture for this game. Way to make it weird."
                initiate_game_loop = false
            end
    #If user enters neither YES nor NO, ask again.
    else
        puts "I'm but a simple game and need simple input."
        puts "Do you want to play a game with me? If Yes, type 'Y'. If No, type 'N'"
        initiate_game = gets.chomp.upcase
    end
end