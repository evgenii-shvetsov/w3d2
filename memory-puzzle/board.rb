require "./card.rb"

class Board 
    attr_reader :size
    def initialize(n)
        @board = Array.new(n) {Array.new(n)}
        self.populate
        @size = n * n
    end

    def [](position)
        row,col = position
        @board[row][col]
    end

    def []=(position,value)
        row,col = position
        @board[row][col] = value
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

    def render
        @board.each do |row|
            puts row.join(" ")
        end  
    end

    def shuffler
        cards_arr = []
        alphabet = ("A".."Z").to_a.shuffle
        num = @board.length * 2
        # num.times do
        #     val = alphabet.pop
        #     card_1 = Card.new(val)
        #     card_2 = Card.new(val)
        #     cards_arr << card_1 << card_2
        # end
        i = 0
        while i < num
            val = alphabet.pop
            card_1 = Card.new(val)
            card_2 = Card.new(val)
            cards_arr << card_1 
            cards_arr << card_2
            i += 1
        end
        cards_arr
    end

    def render
        (0...@board.length).each_with_index do |row, i|
            (0...@board.length).each_with_index do |ele, j| 
                if ele.face_up 
                    print ele.value
                else
                    print '_'
                end
            puts
            end
        end
    end

 
    
    def compare_reveals(position_1, position_2)
        if self.reveal(position_1) == self.reveal(position_2)
            @board[position_1]
        end
    end

end

# def shuffler
#     alphabet = ("A".."Z").to_a
#     # pairs = @size / 2
#     cards = alphabet.sample(@board.length * 2)
#     cards + cards
# end


    # def hidden_render
    #     hidden = @board.clone
    #     hidden.map do |row|
    #         row.map do |card|
    #             card = :O
    #         end
    #     end
    #     hidden
    # end

    #def render
    #    @board.each do |row|
    #        row.each do |card_instance|
    #            if card_instance.face_up
    #                puts "_"
    #            else
    #                puts card.value
    #            end
    #        end
    #    end


  