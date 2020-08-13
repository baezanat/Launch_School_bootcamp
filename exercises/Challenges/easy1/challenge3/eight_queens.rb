=begin
The 8 queens puzzle is based on the classic strategy games problem which is in this case putting 8 chess queens on an 8x8 chessboard such that none of them is able to capture any other using the standard chess queen's moves. The color of the queens is meaningless in this puzzle, and any queen is assumed to be able to attack any other. Thus, a solution requires that no two queens share the same row, column, or diagonal.ù
Find the total number of all possible board positions to this puzzle.

Problem:
- 8 x 8 chessboard
- positions to eliminate
  - not in same row
  - not in the same col
  - not in same diag
- don't forget to check that ALL POSITIONS are returned
- answer: total NUMBER of posible combinations

Board: o => empty, 1 => queen

                        INDEX
    1 0 0 0 0 0 0 0      0
    0 0 1 0 0 0 0 0      1
    0 _ 0 _ _ _ _ _      2
    0 _ 0 _ _ _ _ _      3
    0 _ 0 _ _ _ _ _      4
    0 _ 0 _ _ _ _ _      5
    0 _ 0 _ _ _ _ _      6
    0 _ 0 _ _ _ _ _      7
    etc

VAL 0 1 2 3 4 5 6 7

There will be 1 queen in every row, so we can use an array of 8 digits telling us the column position of the queens, where the INDEX of the elements in the array tells us the ROW, and the element's VALUE corresponds to the COLUMN.

queens = []   => 8-element array
INDEX -> row, VALUE -> column

This data structure takes care of the first two conditions (not in same row, not in same col).
How to ensure the 3rd condition (not in same diagonal)?

examples of numbers that can't coexist:
index 1, value 1
index 2, value 0, 2

index 4,      value 6
i     3, 5,   value 5, 7   => the number to left and right cannot be at a diff of 1
                           => the number with index -2 or + 2 can't be at a diff of 2
=end

class EightQueens
  attr_accessor :positions

  def initialize
    @positions = []
  end

  def eight_queens
    all = (0..7).to_a.permutation(8).to_a
    result = []
    all.each do |arr|
      arr.each_with_index do |num, idx|

      end
    end
  end

  private

  def valid?
    positions.all? {|position| [0, 1, 2, 3, 4, 5, 6, 7].include?(position) }
  end
end

p new = EightQueens.new
puts '----------------------------------'
p new.eight_queens

