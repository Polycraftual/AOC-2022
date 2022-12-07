input = File.open("./input.txt").read.chars

# Create an array of the first four characters in the input string
position = 0

input.each_with_index do | character, index |
  selection = input[index..index+13]
  if selection.size == selection.uniq.size
    puts index+14
    break
  end
end

# increment the starting position by one
#   tell me the position of the last letter

#   four_characters= (input.chars.each_slice(4).to_a)

# # four_characters[position].size == four_characters[position].uniq.size
#   # calculate the position of the last character in the full string

# pp input.size
# pp four_characters
# pp input.chars.each_slice(4)
# pp four_characters[0].size == four_characters[0].uniq.size
