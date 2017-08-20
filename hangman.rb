
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

$cipher = $random_word.gsub(/[a-z]/, '*')
puts $cipher2

def choice
  $random_word2.each_with_index do |i,index|
  if i.include? gets.chomp
    $cipher[index] = i
    puts $cipher
      else puts $cipher
      puts "Incorrect letter"
  end
 end
end
choice







































































 
 














