# Read the input file one
input = File.readlines("./example.txt").map

# Create a list of items and assign them a sequential priority
def priorities
  types = [*('a'..'z'), *('A'..'Z')]
  priorities = types.map.with_index { |type, index| [type, index+1] }.to_h
end

class Backpack
  # Makes the ID visible to the outside world
  attr_reader :items, :priority
  def initialize (backpack_as_string, priorities)
    @items = backpack_as_string
    @priority = priorities
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

  # Calculate the priority for reorganising those items
  def priority_calc
    priorities[shared_items[0]]
  end

  def whole_backpack
    pocket_one + pocket_two
  end

end

# Create a backpack for each line of the input
backpacks = []

input.each_with_index do |backpack_as_string|
  backpack = Backpack.new(backpack_as_string.chomp, priorities)
  #add each backpack to an array
  backpacks.push(backpack)
end

# Add up the total priority for all the shared items in backpacks
overall_priority = backpacks.map(&:priority_calc).sum

# Every three backpacks is a group of elves
def find_badge (backpacks)
  group_badges = []
  backpacks.each_slice(3) do | group_backpack |
    badge = group_backpack[0].whole_backpack & group_backpack[1].whole_backpack & group_backpack[2].whole_backpack
    group_badges.push(badge[0])
  end
  return group_badges
end

# Find the priority of each badge
badge_priority = find_badge(backpacks)

# Add up the total priority for all badges
total_badge_priority = badge_priority.map{ |badge| priorities[badge] }.sum

# puts overall_priority

puts total_badge_priority
