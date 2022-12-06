stacks, instructions = File.open("./input.txt").read.split("\n\n")

# Set up the stacks

# Each row as a string
messy_rows = stacks.split("\n")

# Work out how many stacks we need to care about
number_of_stacks = (messy_rows.last.strip.split("   ")).last.to_i

# Remove the stack name row
messy_rows.pop

# Create an array for each row with each crate as a separate item
tidy_rows = []

crates = messy_rows.each do |row|
  tidy_row = []
  row.chars.each_slice(4).map do | slice |
  slice[1]
  tidy_row.push(slice[1])
  end
  tidy_rows.push(tidy_row)
end

# Create stack arrays, one for each of the stacks in the input
stacks = []
number_of_stacks.times do
  stacks.push([])
end

# For each item in the tidied row, running through each stack sequentially, take the crate and add it to the relevant stack
tidy_rows.each do | row |
  row.each_with_index do | crate, index |
    stacks[index].push(crate)
  end
end

# Reverse the stacks to put the top crate at the end
stacks.map! do | row |
  row.reverse.reject{| crate | crate == " "}
end

# Instructions
# Take each new line as an action string
actions = instructions.split("\n")



actions.each do | action |
  # RegEx to select the digits from each instruction
  # Each action becomes an array of number to move, starting stack, ending stack
  variable = action.scan(/(\d+)/).flatten.map(&:to_i)
  # Use the first digit in each action to say how many times to do the thing
  variable[0].times do
    # Find the top crate from the starting stack and remove it
    crate = stacks[variable[1]-1].pop
    # Put it on the top of the end stack
    stacks[variable[2]-1].push(crate)
  end
end

pp stacks