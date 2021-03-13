class Game

    attr_accessor :board, :player_1, :player_2
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

    def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def won?
        x = []
        o = []
        @board.cells.each_with_index do |token, i|
            token == "X" ? x << i : nil
            token == "O" ? o << i : nil
        end
        result = []
        WIN_COMBINATIONS.each do |comb|
            if (comb-x).empty?
                result =  comb
            elsif (comb-o).empty?
                result = comb
            end
        end
        result.length > 0 ? result : false
    end

    def draw?
        @board.full? == true && self.won? == false ? true : false
    end

    def over?
        self.won? != false || self.draw? == true ? true : false
    end

    def winner
        if self.won? !=false
            @board.cells.select {|i| i == "X"}.length > @board.cells.select {|i| i == "O"}.length ? "X" : "O"    
        end
    end

    def turn
        pos = self.current_player.move(@board)
        @board.valid_move?(pos) ? @board.update(pos, current_player) : self.turn
    end

    def play
        while over? == false
            self.turn

        end

        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end

end