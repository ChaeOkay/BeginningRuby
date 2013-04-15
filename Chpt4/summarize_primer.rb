lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join
puts "#{line_count} lines"

total_characters = text.length
puts "#{total_characters} characters"
# can also do 
# puts "#{text.length} characters"

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces"

word_count = text.split.length
puts "#{word_count} words"

sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"

paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"

puts "#{sentence_count/paragraph_count} sentence per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"


stopwords = %w{ the a by on for of are with just but and to the my I has some in }
words = text.scan(/\w+/)
keyword = words.select { |text| !stopwords.include?(text) }
# the phrase argument "stopwords.include?(text)" looks for when stopwords match the text. 
# the phrase argument "!stopwords.include?(text)" looks for when stopwords do NOT match the text.
# select only returns when conditions are true
puts "\"#{keyword.join(' ')}\""

puts "The percentage of keywords to text is #{((keyword.length.to_f/words.length.to_f)*100).to_i}"