require_relative "game"

def set_hidden_word(content)
  content.map!{|word| word.delete("\n")}
  content = content.collect{|word| word if 5 < word.length && word.length < 12}.compact
  word_to_guess = content.sample
  hidden_word = word_to_guess.split("")
  hidden_word
end

def load_game
  puts "If you want start a new game type 1, if you want to load your previous game type 2"
  answer = gets.chomp
  if answer == "2"
    Dir.each_child('saved_game'){|file| puts file}
    puts "Print the name of the saving"
    file_name = "saved_game/#{gets.chomp}.rb"
    File.open(file_name, "rb") do |file|
    loaded_instance = Marshal.load(file.read)
    loaded_instance.checking_guess
end
  end
end

file = '../google-10000-english-no-swears.txt'
load_game
content = File.readlines(file)
hidden_word = set_hidden_word(content)

hello = Game.new(hidden_word)

hello.start_hidding
hello.play_again(content)
