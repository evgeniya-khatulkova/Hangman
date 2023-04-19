file = '../google-10000-english-no-swears.txt'

content = File.readlines(file)
content.map!{|word| word.delete("\n")}
content = content.collect{|word| word if 5 < word.length && word.length < 12}.compact
p content.sample
