class Card
    attr_accessor :value, :face_up
    def initialize(value)
        @value = value
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def hide 
        @face_up = false
    end

    def ==(card_1, card_2)
        card_1 == card_2
    end
end