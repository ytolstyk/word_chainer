require "set"

class WordChainer
  attr_reader :start_word, :end_word
  
  def initialize(start_word, end_word, file_name = "dictionary.txt")
    @dictionary = File.read(file_name).split.to_set
    @start_word = start_word
    @end_word = end_word
    @current_words = [start_word]
    @all_seen_words = []
  end
  
  def run
    return "You chose poorly" unless @start_word.length == @end_word.length
    modify_dictionary_length
    count = 0
    until @current_words.empty?
      count += 1
      new_current_words = check_for_seen
      if new_current_words.include?(@end_word)
        return "The chain is #{count} steps long." 
      end
      populate_current_words(new_current_words)    
    end
    return "No chain"
  end
  
 
  private 
  
 
  #populates array with unseen words
  def check_for_seen
    array = []
    @current_words.each do |word|    
      unless @all_seen_words.include?(word)
        array += all_adjacent_words(word) 
        @all_seen_words << word
      end   
    end
    array
  end
  
  def populate_current_words(array)
    @current_words = []
    array.each do |word|
      @current_words << word unless @all_seen_words.include?(word)
    end
  end
  
  #send word, get array of adjacent words
  def all_adjacent_words(current_word)
    adjacent_words = []
    @dictionary.each do |word|
      count = 0
      word.length.times do |i|
        count += 1 unless word[i] == current_word[i]
      end
      adjacent_words << word if count == 1
    end
    adjacent_words
  end  
  
  def modify_dictionary_length
    @dictionary.select! { |el| el.length == @start_word.length }
  end
  
end