class Array
  def my_each(&proc)
    self.length.times do |i|
      proc.call(self[i])
    end
  end
  
  def my_map(&proc)
    map_array = []
    self.length.times do |i|
      map_array << proc.call(self[i])
    end
    map_array
  end
  
  def my_select(&proc)
    select_array = []
    self.length.times do |i|
      select_array << self[i] if proc.call(self[i])
    end
    select_array
  end
  
  def my_inject(&proc)
    final = self[0]
    (self.length - 1).times do |i|
      final = proc.call(final, self[i + 1])
    end
    final 
  end
  
  def my_sort!(&proc)
    sorted = false
    until sorted
      sorted = true
      (self.length - 1).times do |i|
        if proc.call(self[i], self[i + 1]) > 0
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    self
  end
  
  def my_sort(&proc)
    temp = self.dup
    temp.my_sort!(&proc)
  end
  
end

def eval_block(*num, &proc)
  if proc.nil?
    puts "NO BLOCK GIVEN!"
  else
    proc.call(*num)
  end
end

