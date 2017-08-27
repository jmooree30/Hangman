require 'json'
load 'display.rb'

class Hangman
  attr_accessor :name
  @name = name

  def initialize
    puts 'What is your name?'
    @name = gets.chomp
    puts <<~MESSAGE
      ################################################
                         HANGMAN
      ################################################
                     _________
                    |
                    |       |
                    |       O
                    |      /|\
                    |       |
                    |      / \
                    |
                    -----------------
      Welcome #{@name} to Hangman. The computer will generate
      a 5-12 letter random word. You will try to guess
      that word one letter at a time. Try to solve the
      puzzle before time runs out!
    MESSAGE
  end
end

class Gameplay
  attr_accessor :array, :filestuff, :random_word, :cipher, :random_word2, :counter

  def initialize
    @array = []

    @filestuff = File.foreach('5text.txt') do |x|
      chomped = x.chomp
      @array << chomped if chomped.length.between?(5, 12)
    end

    @random_word = @array.sample
    @cipher = @random_word.gsub(/[a-z]/, '*').split(//)
    @random_word2 = @random_word.split(//)
    @counter = 5

    puts 'Would you like to load a saved game? Y/N'
    saved_game = gets.chomp
    if saved_game == 'Y'
      game_file = File.read('saved.json')
      data = JSON.parse(game_file)
      @filestuff = data['filestuff']
      @random_word = data['random_word']
      @cipher = data['cipher']
      @random_word2 = data['random_word2']
      @counter = data['counter']
    end
    puts @cipher.join
    puts 'Enter a letter.'

    def to_json
      JSON.generate(filestuff: @filestuff, random_word: @random_word, cipher: @cipher, random_word2: @random_word2)
    end

    def save_game(string)
      File.open('saved.json', 'w') { |game_file| game_file.write(string) }
    end

    def choice(n)
      @random_word2.each_with_index { |i, index| @cipher[index] = i if i == n }

      if n == @random_word2.join
        puts 'You win'
        puts 'would you like to start another game? Y/N'
        new_game = gets.chomp
        if new_game == 'Y'
          Hangman.new
        else
          exit
        end
      end

      if @random_word2.include?(n) == false
        @counter -= 1
        display
        puts "#{@counter} guesses remaining."
      end

      if @counter == 0
        puts 'would you like to start another game? Y/N'
        new_game = gets.chomp
        exit if new_game != 'Y'
      end

      save_game(to_json) if n == '1'

      puts @cipher.join
      puts 'Want to save? Press 1 to save.'
    end

    @counter = 5
    while @counter > 0
      choice(gets.chomp)
    end
  end
end

Hangman.new
Gameplay.new
