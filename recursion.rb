def sum_iterative(array)
  array.inject(:+)
end

def sum_recursive(array)
  return 0 if array.empty?
  num = array.pop
  sum_recursive(array) + num
end

def exp_1(num, power)
  return 1 if power == 0
  num * exp_1(num, power - 1)
end

def exp_2(num, power)
  return 1 if power == 0
  return exp_2(num, power / 2) ** 2 if power.even?
  num * ( exp_2(num, (power - 1) / 2) ** 2 )
end

def range(start, finish)
  return [] if finish <= start
  range(start + 1, finish).unshift(start) #=> []
end

def deep_dup(array) 
  answer = []
  array.each do |element|
    if element.is_a?(Array)
      answer << deep_dup(element)
    else
      answer << element
    end
  end
  answer
end

def fibonacci_iter(n)
  a = 0
  b = 1
  fib_nums = []
  while fib_nums.length < n
    fib_nums << a
    a, b = b, a + b
  end
  fib_nums
end

def fibonacci_rec(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  
  fib_nums = fibonacci_rec(n-1)
  fibonacci_rec(n-1) << fib_nums[-2] + fib_nums[-1]
end

def bsearch(array, target)
  return 0 if (array[0] == target) && (array.length == 1)
  return nil if array.length == 1 && array[0] != target
  half = array.length / 2
  if target >= array[half]
    temp = bsearch(array[half..-1], target)
    return nil unless temp
    half + temp
  else
    temp = bsearch(array[0...half], target)
    return nil unless temp
    temp
  end  
end
#--
def make_change(amount, change)
  return [] if amount == 0
  change.each do |coin|
    if amount - coin >= 0
      return make_change(amount - coin, change).push(coin)
    end
  end  
  return []
end

def change_wrapper(amount, change)
  change.sort!.reverse!
  answer = []
  max = amount * change[-1]
  until change.length == 0
    temp = make_change(amount, change)
    if temp.length < max
      answer = temp
      max = temp.length
    end
    change.shift
  end
  answer
end

def merge_sort(array)
  return array if array.length == 1
  half = array.length / 2
  left = array[0...half]
  right = array[half..-1]
  merge(merge_sort(left), merge_sort(right))
end

def merge(array1, array2)
  answer = []
  until array1.length == 0 || array2.length == 0
    if array1[0] < array2[0]
      answer << array1.shift
    else
      answer << array2.shift
    end
  end
  answer += array1
  answer += array2
  answer
end