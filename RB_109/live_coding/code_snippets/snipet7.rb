def amethod(param)
  param += " universe"
  param << " world"
end 

str = "hello"
amethod(str)

p(str)

def amethod(param)
  param << " world"
end 

str = "hello"
amethod(str)

p(str)

