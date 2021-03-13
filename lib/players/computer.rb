require "./config/environment.rb"


module Players
    class Computer < Player
  
      def move(board)
        rand = rand(1..9).to_s
        board.valid_move?(rand) ? rand : self.move(board)
      end

    end

end