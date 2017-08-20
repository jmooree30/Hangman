load 'display.rb'

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
Welcome to Hangman. The computer will generate
a 5-12 letter random word. You will try to guess
that word one letter at a time. Try to solve the
puzzle before time runs out! 


"

$array = []
File.foreach('5text.txt') do |x| $array << x if (x.chomp.length >= 5 and x.chomp.length <= 12) end
$random_word = $array.sample
$random_word2 = $random_word.split(//)
puts $random_word2.join

$cipher = $random_word.gsub(/[a-z]/, '*').split(//)
puts $cipher.join

def choice(n)
  $random_word2.each_with_index do |i,index|
    if i == n
    $cipher[index] = i 
    end 
  end 
    if $random_word2.include?(n) == false
    $counter -= 1
    display_gallows
    puts "incorrect guess"
    end 
  puts $cipher.join
end


$counter = 5
while $counter > 0
choice(gets.chomp)
end 







































































 
 














