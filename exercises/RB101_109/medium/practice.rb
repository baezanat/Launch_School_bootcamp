#) Recursive Sum
#
# # Write a method that finds the recursive sum of the digits of the given positive integer. 
# Stop when you've reached a single-digit sum, and that single-digit sum should be the return 
# value of your method.

# Examples:
# 746 => 17 => 8
# 1234 => 10 => 1

p recursive_sum(7) == 7
p recursive_sum(746) == 8
p recursive_sum(1234) == 1
p recursive_sum(222222) == 3
p recursive_sum(90876) == 3
