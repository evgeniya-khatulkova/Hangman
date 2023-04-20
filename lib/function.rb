module Function

def hangman
if @wrong_letters.size == 0
  puts "-----"
  puts "|    |"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
elsif @wrong_letters.size == 1
  puts "-----"
  puts "|    |"
  puts "|    |"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
elsif @wrong_letters.size == 2
  puts "-----"
  puts "|    |"
  puts "|    |"
  puts "|    0"
  puts "|"
  puts "|"
  puts "|"
  puts "|"
elsif @wrong_letters.size == 3
  puts "-----"
  puts "|    |"
  puts "|    |"
  puts "|    0"
  puts "|   /"
  puts "|"
  puts "|"
  puts "|"
elsif @wrong_letters.size == 4
  puts "-----"
  puts "|    |"
  puts "|    |"
  puts "|    0"
  puts "|   /"
  puts "|"
  puts "|"
  puts "|"
elsif @wrong_letters.size == 5
  puts "-----"
  puts "|    |"
  puts "|    |"
  puts "|    0"
  puts "|   /|"
  puts "|"
  puts "|"
  puts "|"
elsif @wrong_letters.size == 6
  puts "-----"
  puts "|    |"
  puts "|    |"
  puts "|    0"
  puts "|   /|\\"
  puts "|"
  puts "|"
  puts "|"
elsif @wrong_letters.size == 7
    puts "-----"
    puts "|    |"
    puts "|    |"
    puts "|    0"
    puts "|   /|\\"
    puts "|   / "
    puts "|"
    puts "|"
  elsif @wrong_letters.size == 8
    puts
    puts "-----"
    puts "|    |"
    puts "|    |"
    puts "|    0"
    puts "|   /|\\"
    puts "|   / \\"
    puts "|"
    puts "|"
  end
end

end
