require 'json'
load 'display.rb'

class Hangman
  attr_accessor :name
  @name = name

  def initialize
    puts "What is your name?"
    @name = gets.chomp
    puts "
################################################
                   HANGMAN
################################################

               _________
              |        
              |       |
              |       O
              |      /|\\
              |       |
              |      / \\
              |
              -----------------
Welcome #{@name} to Hangman. The computer will generate
a 5-12 letter random word. You will try to guess
that word one letter at a time. Try to solve the
puzzle before time runs out! 


"
  Gameplay.new
  end
end

class Gameplay
  attr_accessor :cipher, :random_word2, :counter
  @cipher = nil
  @random_word2 = nil
  @counter = nil
  def initialize
    array = []
    File.foreach('5text.txt') do |x|
      chomped = x.chomp
      array << chomped if (chomped.length >= 5 and chomped.length <= 12)
    end
    random_word = array.sample
    @random_word2 = random_word.split(//)
    @cipher = random_word.gsub(/[a-z]/, '*').split(//)
    puts @cipher.join

  def choice(n)
    @random_word2.each_with_index do |i,index|
      if i == n
        @cipher[index] = i 
      end 
    end 
      if n == @random_word2.join.to_s
        puts "You win"
        puts "would you like to start another game? Y/N"
        new_game = gets.chomp
        if new_game == "Y"
          Hangman.new
          else exit 
        end
      end
      if @random_word2.include?(n) == false
        @counter -= 1
        display
        puts "#{@counter} guesses remaining."
      end
      if @counter == 0
        puts "would you like to start another game? Y/N"
        new_game = gets.chomp
        if new_game == "Y"
          Hangman.new
          else exit 
        end
      end 
        puts @cipher.join 
  end

  @counter = 5
  while @counter > 0 
    choice(gets.chomp)
  end

 end 
end
Hangman.new








































































 
 














