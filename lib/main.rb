require_relative "game"

def set_hidden_word(content)
  content.map!{|word| word.delete("\n")}
  content = content.collect{|word| word if 5 < word.length && word.length < 12}.compact
  word_to_guess = content.sample
  hidden_word = word_to_guess.split("")
  hidden_word
end


file = '../google-10000-english-no-swears.txt'
content = File.readlines(file)
hidden_word = set_hidden_word(content)

hello = Game.new(hidden_word)

hello.start_hidding
