input = File.open("./input.txt").read.chars

# Create an array of the first four characters in the input string
position = 0

# Loop over each character
input.each_with_index do | character, index |
  # Make a selection of four/fourteen characters
  selection = input[index..index+13]
  # Check to see whether the size of the selection matches the
  # size of of the selections unique values
  if selection.size == selection.uniq.size
    # Spit out the index of the last character in the selection
    puts index+14
    # Stop the loop
    break
  end
end
