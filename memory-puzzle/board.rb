class Board 

    def render
        @board.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @board = Array.new(n) {Array.new(n)}
        @size = n * n
        # @populate = 
    end

    def populate
        cards = self.shuffler
        i = 0 
        card = cards.shuffle
        (0...@board.length).each do |row|
            (0...@board.length).each do |col|
                @board[row][col] = card[i]
                i += 1
            end
        end
    end

    def shuffler
        # cards = []
        alphabet = ("A".."Z").to_a
        # (16 / 2).times do 
        #     cards << alphabet.sample
        # end
        # cards
        cards = alphabet.sample(8)
        cards + cards
    end
    

    
end