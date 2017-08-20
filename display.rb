def display
		
		if $counter == 5
		puts "  ______"
		puts "  |   \\|"
		puts "       |"
		puts "       |"
		puts "       |"
		puts "       |"
		puts "-------^-------"
		elsif $counter == 4
		puts "  ______"
		puts "  |   \\|"
		puts "  O    |"
		puts "       |"
		puts "       |"
		puts "       |"
		puts "-------^-------"
		elsif $counter == 3
		puts "  ______"
		puts "  |   \\|"
		puts "  O    |"
		puts "  |    |"
		puts "       |"
		puts "       |"
		puts "-------^-------"
		elsif $counter == 2 
		puts "  ______"
		puts "  |   \\|"
		puts "  O    |"
		puts " -|    |"
		puts "       |"
		puts "       |"
		puts "-------^-------"
		elsif $counter == 1
		puts "  ______"
		puts "  |   \\|"
		puts "  O    |"
		puts " -|-   |"
		puts "       |"
		puts "       |"
		puts "-------^-------"
		else
		puts "  ______"
		puts "  |   \\|"
		puts "  O    |"
		puts " -|-   |"
		puts "  ^    |"
		puts " //    |"
		puts "-------^-------"
                puts "AGHHHHH YOU LOSE!"
		end
	end
