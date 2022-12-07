input = File.open("./example.txt").read.split("\n")

actions = []
structure = []

find_actions = input.each_with_index do | line, index |
  if action = line["$"]
    actions.push(input[index])
  end
end

build_structure = actions.each do | action |
  if action["cd"]
    structure.push(action[5])
  end
end

pp input
puts actions
puts structure