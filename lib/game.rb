require_relative "function"
BLUE = "\e[104m"
YELLOW = "\e[33m"
ENDCOLOR = "\e[0m"


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

  puts "The Poor Guy is alive! Such a relief! You are a real hero. Do you want to play again?"

  exit
end

def lost_game
  self.hangman
  puts
  puts "You lost. Sorry, Mr. Poor Guy"

  puts "The hidden word was #{YELLOW}#{@hidden_word.join("")}#{ENDCOLOR}."
end

def start_hidding
  @hidden_word.each{|letter|  " _ "}
  puts "Nice to see you! We will play a hangman game. You need to guess the hidden word before the Poor Guy will be hanged. You can make only 8 mistakes. Good luck to you and to the Poor Guy"
  puts "Word you need to guess:"
  @hidden_word.length.times { print "#{BLUE} _ #{ENDCOLOR}"}
  self.checking_guess
end

def checking_guess
  while @wrong_letters.length != 8
    puts
    self.hangman
    puts
    puts
    puts "Enter letter"
    letter = gets.chomp.downcase
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
