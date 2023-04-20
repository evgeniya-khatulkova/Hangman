require_relative "game"

file = '../google-10000-english-no-swears.txt'

def set_hidden_word(content)
  content.map!{|word| word.delete("\n")}
  content = content.collect{|word| word if 5 < word.length && word.length < 12}.compact
  word_to_guess = content.sample
  hidden_word = word_to_guess.split("")
  hidden_word
end

def load_game(content)

  puts "If you want start a new game type 1, if you want to load your previous game type 2"
  answer = gets.chomp

  until answer == "1" || answer == "2"
    puts "press 1 - to play a new game, 2 - to load a new game "
    answer = gets.chomp
  end
  if answer == "2"
    puts "#{YELLOW}########################{ENDCOLOR}"
    Dir.each_child('saved_game'){|file| puts "#{YELLOW}#{file}#{ENDCOLOR}" if file != ".DS_Store"}
    puts "#{YELLOW}########################{ENDCOLOR}"

    puts "Print the name of the saving"

    file_name = "saved_game/#{gets.chomp}.rb"
    begin
      File.open(file_name, "rb") do |file|
        loaded_instance = Marshal.load(file.read)
        loaded_instance.checking_guess
        loaded_instance.play_again(content)
      end
    rescue => e
     puts "Saving is not found"
     load_game(content)
    end
  end
end


Game.start_hidding(file)
