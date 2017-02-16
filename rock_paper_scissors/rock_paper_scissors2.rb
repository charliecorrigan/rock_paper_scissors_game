class GameStarter
    def invite
        #Method asks if user wants to play.
        @invite_message = "Hello! Do you want to play a game with me? Enter Yes (Y) or No (N)"
        @play_message = "OK, Let's play!"
        @quit_message = "OK, Bye!"
        @invalid_user_entry_message = "I didn't understand that."
        puts @invite_message
        initiate_game = gets.chomp.upcase
            if initiate_game == "N" 
                puts @quit_message
            elsif initiate_game == "Y"
                puts @play_message 
                play = RockPaperScissors.new
                play.start
            else
                puts @invalid_user_entry_message
                invite
            end
    end
end

class RockPaperScissors
    def start
        #Method prompts player turn, computer turn, determines game result, and asks for replay.
        computer_move = move_selection
        @instructions_message = "On the count of three, select rock (R), paper (P), or scissors (S)\n1...\n2...\n3...\nGo!"
        @computer_move_message = "The computer chose #{computer_move}."
        @invalid_move_message = "That was NOT an appropriate hand gesture for this game. Way to make it weird."
        puts @instructions_message
        player1_move = gets.chomp.upcase
            if valid_selection(player1_move) == true
                puts @computer_move_message
                game_result = find_winner(player1_move, computer_move)
                puts game_result
            else
                puts @invalid_move_message
                start
            end
        replay_request
    end

    def replay_request
        #Method asks if user wants to play again.
        @replay_invite = "Do you want to play again? Enter Yes (Y) or No (N)"
        puts @replay_invite
        initiate_replay = gets.chomp.upcase
        if initiate_replay == "Y" 
            start
        elsif initiate_replay == "N"
            puts "OK, Bye"
            initiate_game_loop = false
        else
            puts "I didn't understand that."
            replay_request              
        end
    end

    def valid_selection( selection )
        #Method determines if user input is valid for game.
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
        #Method selects rock, paper, or scissors randomly for the computer's turn.
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
        #Method compares player move and computer move and determines the winner. 
        @player1 = player1_move
        @com_move = computer_move
        @tie = "It was a tie game."
        @win = "You win!"
        @lose = "You lose. Sorry."
        if @com_move == "Rock" && @player1 == "R"
            return @tie
        elsif @com_move == "Rock" && @player1 == "P"
            return @win
        elsif @com_move == "Rock" && @player1 == "S"
            return @lose
        elsif @com_move == "Paper" && @player1 == "R"
            return @lose
        elsif @com_move == "Paper" && @player1 == "P"
            return @tie
        elsif @com_move == "Paper" && @player1 == "S"
            return @win
        elsif @com_move == "Scissors" && @player1 == "R"
            return @win
        elsif @com_move == "Scissors" && @player1 == "P"
            return @lose
        else @com_move == "Scissors" && @player1 == "S"
            return @tie
        end
    end
end

new_game = GameStarter.new
new_game.invite