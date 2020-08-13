=begin
Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.
Example:
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
=end

require 'pry'
require 'pry-byebug'

# def staggered_case(str)
#   arr_all_chars = str.chars
#   clean_string = str.gsub(/[^a-z]/i, '')
#   arr_clean = clean_string.chars
#   arr_clean.each_with_index do |char, idx|
#     char.upcase! if idx.even?
#     char.downcase! if idx.odd?
#   end
#   result_array = []
#   arr_all_chars.each_with_index do |char, idx|
#     if !char.match(/[a-z]/i)
#       result_array = arr_clean.insert(idx, char)
#     else
#       next
#     end
#   end
#   result_array.join
# end

def staggered_case2(str)
  char_arr = str.chars
  toggle = true
  result = []
  char_arr.each do |char|
    if char.match(/[a-z]/i)
      if toggle
        result << char.upcase
      elsif !toggle
        result << char.downcase
      end
      toggle = !toggle
    else
      result << char
    end
  end
  result.join
end

staggered_case2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!' # => true
staggered_case2('ALL CAPS') == 'AlL cApS' # => true
staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs' # => true
