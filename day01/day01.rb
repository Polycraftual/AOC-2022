#Elf
class Elf
  # Makes the ID visible to the outside world
  attr_reader :id, :food, :calories
  def initialize (food_as_string, id, calories)
    @id = id
    @food = food_as_string.split("\n").map(&:to_i)
    @calories = food.sum
  end
end

#Take the input and make a new item in an array that is separate for each elf
input = File.open("./input.txt").read.split("\n\n")

# Shows the type of "input"
#puts input.class

# How long is this array, how many items are in it?
#puts input.size

# Shows the specific item from the array
#puts input[2]

# Shows the type of the information in the array
#puts input[2].class

#elf = Elf.new("100\n400\n500", 1, :calories)
#puts elf.id
#puts elf.food[1].class
#puts elf.calories

elves = []

input.each_with_index do |food_as_string, index|
  elf = Elf.new(food_as_string, index, :calories)
  elves.push(elf)
end

elves = elves.sort_by(&:calories)
#puts "Elf #{elves[241]} has #{elves[241].calories} calories"

top_elves = elves[239..241]
top_elves_calories = top_elves.map(&:calories).sum
puts top_elves
puts "Top three elves have #{top_elves_calories} calories"
