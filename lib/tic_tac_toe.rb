class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move (i, token = "X")
        if token == "X" || token == "O"
            @board[i] = token
        end
    end

    def position_taken? (i)
        @board[i] != " "
    end

    def valid_move? (i)
        i.between?(0,8) && !position_taken?(i)
    end

    def turn_count
        @board.count{|square| square != " "}
        # count = 0
        # @board.each do |token|
        #     if token != " "
        #         count += 1
        #     end
        # end
        # count
    end

    def current_player
        turn_count.even? ? "X" : "O"
        # player_turn = turn_count % 2

        # if player_turn == 0
        #     "X"
        # else
        #     "O"
        # end
    end

    def turn
        puts "Please choose your next move by press a number between 1-9:"
        input = gets.strip
        index = input_to_index(input)
        
        if valid_move?(index)
            move(index, current_player)
        else
            turn
        end

        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] #checking whether the same tokens occupying the positions
                return combo
            end
        end
    end

    def full?
        turn_count == 9
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        won? ? @board[won?[0]] : nil
    end

    def play
        until over? do
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end
