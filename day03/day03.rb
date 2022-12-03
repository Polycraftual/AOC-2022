# Read the input file one
input = File.readlines("./input.txt").map

class Backpack
  # Makes the ID visible to the outside world
  attr_reader :items
  def initialize (backpack_as_string)
    @items = backpack_as_string
  end

  def pocket_one
    # Take the first half of the backpack string
    pocket_one_items = items[0..(items.size/2)-1].scan /\w/
  end

  def pocket_two
    # Take the second half of the backpack string
    pocket_two_items = items[(items.size/2)..items.size].scan /\w/
  end

  # Compare pocket one and two to find any shared items
  def shared_items
    pocket_one & pocket_two
  end

  # Create a list of items and assign them a sequential priority
  def priorities
    types = [*('a'..'z'), *('A'..'Z')]
    priorities = types.map.with_index { |type, index| [type, index+1] }.to_h
  end

  # Calculate the priority for reorganising those items
  def priority_calc
    priorities[shared_items[0]]
  end

end

# Create a backpack for each line of the input
backpacks = []

input.each_with_index do |backpack_as_string|
  backpack = Backpack.new(backpack_as_string.chomp)
  #add each backpack to an array
  backpacks.push(backpack)
end

# Add up the total priority for all the shared items in backpacks
overall_priority = backpacks.map(&:priority_calc).sum


puts backpacks[0].items
puts backpacks[0].pocket_one
puts backpacks[0].pocket_two
puts backpacks[0].shared_items
puts backpacks[0].priority_calc
puts overall_priority
