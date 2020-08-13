=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. 
You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle 
switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on 
after n repetitions.

Example with n = 5 lights:

    round 1: every light is turned on
    round 2: lights 2 and 4 are now off; 1, 3, 5 are on
    round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
    round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
    round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

INPUT: two integers: number of switches and repetitions
OUTPUT: array of integers (with lights that are on at the end)
RULES:
  - Lights have two possible states and are toggled on and off
  - All lights initially off
  - if n = 1? Should it be toggled when n is even?
ALGORITHM:
  - Keep track of lights on and off (use array with 1 and 0)
  - n = 1, all lights are turned on (the state array should have n elements, all equal to 1)
  - For each round = (n + x) after that, toggle the elements in state at all the indexes that are multiples of n (index % n == 0), 
  increasing n by 1 with each iteration
    - Identify which elements to toggle as described above (index and round)
    - toggle them by changing the elements in the state array at the right indexes 
      - if element is 1, change it to 0, and vice versa
  - Find the indices of all elements that are equal to 1 in the final state array
  - Return an array with these indices
=end

def toggle_switches(lights)
  state = []
  result = []
  state.fill(0, 0...lights)
  n = 1
  loop do
    state.each_with_index do |switch, index|
      if (index + 1) % n == 0
        if state[index] == 1
          state[index] = 0
        elsif state[index] == 0
          state[index] = 1
        end
      end
    end
    n += 1
    break if n > lights
  end
  state.each_with_index do |switch, index| 
    if switch == 1
      result << index + 1
    end
  end
  result
end

p toggle_switches(10) == [1, 4, 9]
p toggle_switches(5) == [1, 4]

