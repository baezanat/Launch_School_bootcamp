birds = ['crow', 'finch', 'hawk', 'eagle']

def assign(arr)
  yield(arr)
end

assign(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(", ") }"}
