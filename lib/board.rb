class Board

    attr_accessor :cells

    def initialize()
        self.reset!
    end

    def reset!
        @cells = Array.new(9," ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(str)
        @cells[input_to_index(str)]
    end

    def input_to_index(str)
        index = str.strip.to_i - 1
    end

    def full?
        @cells.select {|i| i == " "}.length > 0 ? false : true
    end

    def turn_count
        @cells.count {|i| i != " "}
    end

    def taken?(str)
        position(str) == "X" || position(str) == "O" ? true : false
    end

    def valid_move?(str)
        !taken?(str) && input_to_index(str).between?(0,8) ? true : false
    end

    def update(pos,player)
        @cells[input_to_index(pos)] = player.token
    end



end