#----- RECURSION
def factorial(n)
  return 1 if n < 2
  return n * factorial(n - 1)
end


def fibonacci(n)
  seed1 = 0
  seed2 = 1
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  last = fibs(n - 1)
  return last << last[-2] + last[-1]
end



def merge_sort(array)
  p array
  return array if array.length < 2
  length = array.length
  if length > 1
    half = length / 2 - 1
    left = array[0..half]
    right = array[half + 1..-1]
  end
  merge(merge_sort(left), merge_sort(right))
end

def merge(array1, array2)
  answer = []
  until array1.length == 0 or array2.length == 0
    if array1[0] < array2[0]
      answer << array1.shift
    else
      answer << array2.shift
    end
  end
  answer += array1 + array2
  answer
end

def expo1(num, exponent)
  return 1 if exponent == 0
  return expo1(num, exponent - 1) * num
end

def expo2(num, exponent)
  return 1 if exponent == 0
  return expo2(num, exponent / 2) ** 2 if exponent.even?
  return num * expo2(num, (exponent - 1) / 2) ** 2 unless exponent.even?
end

def fibonacci(num)
  a = 0
  b = 1
  answer = []
  while answer.length < num
    answer << a
    a, b = b, a + b
  end
  answer
end

def fibonacci_rec(num)
  return [] if num == 0
  return [0] if num == 1
  return [0, 1] if num == 2
  last = fibonacci_rec(num - 1)
  return last << last[-1] + last[-2]
end

def binary_search(array, num)
  return 0 if array[0] == num
  half = array.length / 2
  if num >= array[half]
    return half + binary_search(array[half..-1], num)
  else
    return binary_search(array[0..half], num)
  end
end