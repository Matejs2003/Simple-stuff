class TTT
  attr_reader :sitka
  def initialize

                        #    0,     1,    2,    3,    4
               @sitka = [  ["1",   "|",  "2",  "|",  "3"],    #0
                           ["4",   "|",  "5",  "|",  "6"],    #1
                           ["7",   "|",  "8",  "|",  "9"]  ]  #2

  end

# => Output method
  def print_sitka
    @sitka.each do |item|
       item.each do |x|
          print x
        end
        puts
    end
    puts
  end


#Input X method
  def num_x
    puts "X - step, make your choise (num): "
    choise_x = gets.strip.to_s

    if choise_x == "1"|| choise_x == "2"|| choise_x == "3"
      @sitka[0][@sitka[0].index(choise_x)] = :X
    elsif choise_x == "4"|| choise_x == "5"|| choise_x == "6"
      @sitka[1][@sitka[1].index(choise_x)] = :X
    elsif choise_x == "7"|| choise_x == "8"|| choise_x == "9"
      @sitka[2][@sitka[2].index(choise_x)] = :X
    end
  end


#Input O method
  def num_o
    puts "Now O - step, make your choise (num): "
    choise_o = gets.strip.to_s

    if choise_o == "1"|| choise_o == "2"|| choise_o == "3"
      @sitka[0][@sitka[0].index(choise_o)] = :O
    elsif choise_o == "4"|| choise_o == "5"|| choise_o == "6"
      @sitka[1][@sitka[1].index(choise_o)] = :O
    elsif choise_o == "7"|| choise_o == "8"|| choise_o == "9"
      @sitka[2][@sitka[2].index(choise_o)] = :O
    end
  end


#Who win method
  def who_win

#the first line is full
    win = :X if sitka[0].count(:X) == 3
    win = :O if sitka[0].count(:O) == 3
#the second line is full
    win = :X if sitka[1].count(:X) == 3
    win = :O if sitka[1].count(:O) == 3
#the third line is full
    win = :X if sitka[2].count(:X) == 3
    win = :O if sitka[2].count(:O) == 3

#either first or second or third column is full
    win = sitka[0][0] if (sitka[0][0] == sitka[1][0] && sitka[0][0] == sitka[2][0])
    win = sitka[1][2] if (sitka[0][2] == sitka[1][2] && sitka[0][2] == sitka[2][2])
    win = sitka[0][4] if (sitka[0][4] == sitka[1][4] && sitka[0][4] == sitka[2][4])

#full diagonal
    win = sitka[1][2] if (sitka[0][0] == sitka[1][2] && sitka[0][0] == sitka[2][4])
    win = sitka[1][2] if (sitka[0][4] == sitka[1][2] && sitka[0][4] == sitka[2][0])

#Congratulation and exit
      if win == :O
      puts "Congratulations #{win} wins"
      exit
    elsif win == :X
      puts "Congratulations #{win} wins"
      exit
    end

  end

#draw...
  def draw
    if ! ( sitka[0].include?("1") || sitka[0].include?("2") || sitka[0].include?("3") ||
           sitka[1].include?("4") || sitka[1].include?("5") || sitka[1].include?("6") ||
           sitka[2].include?("7") || sitka[2].include?("8") || sitka[2].include?("9")
         )
         puts "Draw... nobody wins((("
         exit
    end
  end
end



puts "\n========================================"
puts "Hello, it's Tic-Tac-Toe!!!\n"
first = TTT.new
first.print_sitka

loop do
first.num_x
first.print_sitka
first.who_win
first.draw


first.num_o
first.print_sitka
first.who_win
first.draw
end
