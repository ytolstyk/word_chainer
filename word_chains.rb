require "set"

class WordChainer
  attr_reader :start_word, :end_word
  
  def initialize(start_word, end_word, file_name = "dictionary.txt")
    @dictionary = File.read(file_name).split.to_set
    @start_word = start_word
    @end_word = end_word
    @current_words = [start_word]
    @all_seen_words = []
    @tree = {}
  end
  
  def run
    return "You chose poorly" unless @start_word.length == @end_word.length
    modify_dictionary_length
    count = 0
    until @current_words.empty?
      count += 1
      new_current_words = check_for_seen
      #p @tree
      if new_current_words.include?(@end_word)
        return display_chain(count)
      end
      populate_current_words(new_current_words)    
    end
    
    return "No chain"
  end
  
 
  private 
  
  def display_chain(count)
    puts "The chain is #{count} steps long."
    puts depth_first_search(@start_word).unshift(@end_word).reverse
  end
 
  def depth_first_search(start_word, path = [])
    return nil if @tree[start_word] == []
    return [start_word] if @tree[start_word].include?(@end_word)
    stack = @tree[start_word]
    until stack.empty?
      start = stack.shift
      temp = depth_first_search(start)
      if temp.nil?
        next
      else
        return temp << start_word
      end
    end
  end
 
  #populates array with unseen words
  def check_for_seen
    array = []
    @current_words.each do |word|    
      unless @all_seen_words.include?(word)
        array += all_adjacent_words(word) 
        @tree[word] = array
        array.each do |i|
          @tree[i] = [] unless @all_seen_words.include?(i)
        end
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
      if count == 1 and !@all_seen_words.include?(word)
        adjacent_words << word
      end
    end
    adjacent_words
  end  
  
  def modify_dictionary_length
    @dictionary.select! { |el| el.length == @start_word.length }
  end
  
end