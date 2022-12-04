# Read in the input
input = File.open("./input.txt").read.split("\n")

# For each line of the entry, split them into individual elves

elves = []
inefficient_allocation = 0

input.each_with_index do |pairs_as_string|
  elf = pairs_as_string.split(",")
  elves.push(elf)
end

elves = elves.flatten

# Convert zone allocation ranges to start and end points
elves.each_with_index do |allocation_start_end, index|
  allocation_as_array = allocation_start_end.split("-")
  elves[index] = allocation_as_array
end

# Convert start and end points to a full list of zones
elves.each_with_index do |allocation_as_array, index|
  allocation_as_range = (allocation_as_array[0]..allocation_as_array[1]).to_a
  elves[index] = allocation_as_range
end

# Every two elves, compare their allocation and return the common zones
# If there are common zones compare the full allocations to see if one is entirely
# contained within the other
# If they are fully contained, add to a count of inefficient zone allocation

elves.each_slice(2) do |compare_zones|
  common_zones = compare_zones[0] & compare_zones[1]
  if !common_zones.empty?
    comparison = compare_zones[0]-compare_zones[1]
    if comparison.empty?
      inefficient_allocation = inefficient_allocation+1
    elsif
      comparison = compare_zones[1]-compare_zones[0]
      if comparison.empty?
        inefficient_allocation = inefficient_allocation+1
      end
    end
  end
end

pp elves
pp inefficient_allocation
