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
  
  end
end

class Gameplay
  attr_accessor :array, :filestuff, :random_word, :cipher, :random_word2, :counter
  def initialize
  @array = []
  @filestuff = File.foreach('5text.txt') do |x|
      chomped = x.chomp
      @array << chomped if (chomped.length >= 5 and chomped.length <= 12)
    end
  @random_word = @array.sample
  @cipher = @random_word.gsub(/[a-z]/, '*').split(//)
  @random_word2 = @random_word.split(//)
  @counter = 5
  
  def to_json
    JSON.generate({array: @array, filestuff: @filestuff, random_word: @random_word, cipher: @cipher, random_word2: @random_word2, counter: @counter})
  end

  def load
    game_file = File.read("saved.json")
    data = JSON.parse(game_file)
    @cipher = data["cipher"]
    @random_word2 = data["random_word2"]
    @counter = data["counter"]
  end
  

  def save_game(string)
    game_file = File.open("saved.json","w") do 
    game_file.write(string)
    end 
  end

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
        puts "To save press 1"
        save = gets.chomp
        if save == "1"
          
#Will not save 
          save_game($b.to_json)
        end
      end
      if @counter == 0
        puts "would you like to start another game? Y/N"
        new_game = gets.chomp
        if new_game == "Y"
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
$b = Gameplay.new








































































 
 














