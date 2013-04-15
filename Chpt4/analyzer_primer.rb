text = %q{
Ruby is a great programming language. It is object oriented and has many groovy features. Some people don't like it, but that's not our problem! It's easy to learn. It's great. To learn more about Ruby, visit the official Ruby Web site today.
}

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
# the global substitution here is making sure only one space is between each word. It does this by finding spaces that are over one space long (s+), and replacing them with one space (' '). 
# Strip removes leading and trailing whitespace leftover
# Split, is splitting the string where it finds . ? ! characters (basically, at the end of each sentence) and puts the pieces into an array
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
# sort_by takes the sentences in the sentences array, and rearranges the order to be sorted by sentence length. The method to be "sorted by" is defined in block
one_third = sentences_sorted.length / 3
# we want to find the number of elements in 1/3 of the array
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
# we want to take 1/3 of the total elements from the middle of the sorted text (sentences_sorted). 
# This step is somewhat pre-calculated. The book states we assume there are 6 sentences, so we are 
# specifically targeting index 2,3,4 (excluding 0, 1 and 5, 6) which is in the middle
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
# Now we are looking at each of middle sentences. if any of them match (=~) the words "is" or (|) "are" the sentence is returned. The select method only returns what is true in the block.
puts ideal_sentences.join(". ")
# join puts the idea_sentences together to make them readable by reinserting a . and space between them. 