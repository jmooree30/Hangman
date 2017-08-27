def display
  if @counter == 5
    puts <<~MESSAGE
        ______
        |   \|
             |
             |
             |
             |
      -------^-------
    MESSAGE
  elsif @counter == 4
    puts <<~MESSAGE
        ______
        |   \|
        O    |
             |
             |
             |
      -------^-------
    MESSAGE
  elsif @counter == 3
  puts <<~MESSAGE
        ______
        |   \|
        O    |
        |    |
             |
             |
      -------^-------
    MESSAGE
  elsif @counter == 2
  puts <<~MESSAGE
        ______
        |   \|
        O    |
       -|    |
             |
             |
      -------^-------
    MESSAGE
  elsif @counter == 1
  puts <<~MESSAGE
        ______
        |   \|
        O    |
       -|-   |
             |
             |
      -------^-------
    MESSAGE
  else
  puts <<~MESSAGE
        ______
        |   \|
        O    |
       -|-   |
        ^    |
       //    |
      -------^-------
      AGHHHHH YOU LOSE!
    MESSAGE
  end
end
