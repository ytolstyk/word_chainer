#------ BLOCKS/PROCS/LAMBDAS
def lambda_method
  lambda {return "returning from lambda" }.call
  return "returning from method"
end

def proc_method(p)
  p.call(3)
  block_method(&p)
end

def block_method(&blk)
  blk.call
end

#can take multiple blocks as arguments, but can't use &
def multi_proc_method(p1, &p)
  puts p1.call
  puts p.call
end

p = Proc.new {|x| "i'm in a proc " * x}

proc_method(p)
block_method {puts "i'm in a block"}


#----- RECURSION
def factorial(n)
  return 1 if n <= 0
  return n * factorial(n - 1)
end
