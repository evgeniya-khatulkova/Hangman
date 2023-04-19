file = '../google-10000-english-no-swears.txt'

content = File.readlines(file)
BLUE = "\e[104m"
ENDCOLOR = "\e[0m"

def winning
  puts "The Poor Guy is alive! Such a relief! You are real hero. Do you want to play again?"
  exit
end

content.map!{|word| word.delete("\n")}
content = content.collect{|word| word if 5 < word.length && word.length < 12}.compact
word_to_guess = content.sample
hidden_word = word_to_guess.split("")
hidden_word.each{|letter|  " _ "}


puts "Nice to see you! We will play a hangman game. You need to guess the word hidden word before the Poor Guy will be hanged. You can make only 8 mistakes. Good luck to you and to the Poor Guy"
puts "-----"
puts "|    |"
puts "|    0"
puts "|   /|\\"
puts "|   / \\"
puts "|"

puts "Word you need to guess:"
hidden_word.length.times { print "#{BLUE} _ #{ENDCOLOR}"}


wrong_letters = []
right_letters = []

while wrong_letters.length != 8

puts "Enter letter"
letter = gets.chomp
hidden_word.include?(letter) ? right_letters<<letter : wrong_letters<<letter

puts "#{8 - wrong_letters.length} attempts left"
winning if hidden_word.all?{|letter| right_letters.include?(letter)}
hidden_word.each do |symbol|
  if right_letters.include?(symbol)
    print "#{BLUE} #{symbol} #{ENDCOLOR}"
  else
    print "#{BLUE} _ #{ENDCOLOR}"
  end
end

end
puts

puts "You lost. Sorry, Mr. Poor Guy"

puts "The hidden word was #{hidden_word}."
