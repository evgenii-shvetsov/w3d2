require "./card.rb"
require "./board.rb"

class Game
    def initialize(n)
        @board = Board.new(n)
        @blank_board = Array.new(n) {Array.new(n, "_")}
        #@player = Player.new(name)
        @guesses = 0
    end

    def guess_board#(guess)
        position = play_turn
        row,col = position
        @blank_board[row][col] = @board[position] 
        
    end

    # def guess_1
        
    def render_blank
        @blank_board.each do |row|
            puts row.join(" ")
        end
    end

    def create_board
        @board.populate
        # @board.render
    end

    def play_turn
        puts "Please enter two numbers separated with space"
        input = gets.chomp.split.map(&:to_i)
        if input.length != 2
            raise "please enter two numbers within the correct range"
        end
        input
        # @board.reveal(input)
    end

    def full_turn

        first_guess = self.play_turn
        second_guess = self.play_turn
        if first_guess == second_guess
            @board.reveal(first_guess)
            @board.reveal(second_guess)
        else
            @board.hide(first_guess)
            @board.hide(second_guess)
            @guesses += 1
        end
    end

    def play
        self.create_board 
        self.render_blank
        puts "Guesses: #{@guesses}"
    end

end