require_relative "function"
# require_relative "main"
BLUE = "\e[104m"
YELLOW = "\e[33m"
ENDCOLOR = "\e[0m"
file = '../google-10000-english-no-swears.txt'



class Game

attr_accessor :wrong_letters, :right_letters, :hidden_word

def initialize(hidden_word)
  @hidden_word = hidden_word
  @wrong_letters = []
  @right_letters = []
end

include Function

def winning
  puts
  puts "The right word #{YELLOW}#{@hidden_word.join("")}#{ENDCOLOR}"

  puts "The Poor Guy is alive! Such a relief! You are a real hero."
  play_again
end

def lost_game
  self.hangman
  puts
  puts "You lost. Sorry, Mr. Poor Guy"

  puts "The hidden word was #{YELLOW}#{@hidden_word.join("")}#{ENDCOLOR}."
  play_again
end

def play_again
  puts "Do you want to play again? Yes/no?"
  answer = gets.chomp.downcase
  until answer == "yes" || answer == "no"
    puts "Yes or no?"
    answer = gets.chomp.downcase
  end
  if answer == "yes"
    Game.start_hidding('../google-10000-english-no-swears.txt')
  elsif answer == "no"
    exit
  end
end

def save_it
  Dir.mkdir('saved_game') unless Dir.exist?('saved_game')
  puts "Give a name to the saving"
  file_name = "saved_game/#{gets.chomp}.rb"
  File.open(file_name, "wb") do |file|
    file.write(Marshal.dump(self))
  end
  exit
end

def self.start_hidding(file)
  content = File.readlines(file)
  load_game(content)
  hidden_word = set_hidden_word(content)
  hello = Game.new(hidden_word)
  # hello.hidden_word.each{|letter|  " _ "}
  puts "Nice to see you! We will play a hangman game. You need to guess the hidden word before the Poor Guy will be hanged. You can make only 8 mistakes.  Remember that you can save your game anytime by typing 'save'. Good luck to you and to the Poor Guy"
  puts "Word you need to guess:"
  hello.hidden_word.length.times { print "#{BLUE} _ #{ENDCOLOR}"}
  hello.checking_guess
end

def checking_guess
  while @wrong_letters.length != 8
    puts
    self.hangman
    puts
    puts
    puts "Enter letter"
    letter = gets.chomp.downcase

    self.save_it if letter == "save"

    @hidden_word.include?(letter) ? @right_letters<<letter : @wrong_letters<<letter

    puts "#{8 - @wrong_letters.length} attempts left"
    puts "you have already tried: #{@wrong_letters.join(" ")}"

    @hidden_word.each do |symbol|
      if @right_letters.include?(symbol)
        print "#{BLUE} #{symbol} #{ENDCOLOR}"
      else
        print "#{BLUE} _ #{ENDCOLOR}"
      end
    end
    self.winning if @hidden_word.all?{|letter| @right_letters.include?(letter)}
  end
  self.lost_game
end

end
