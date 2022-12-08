# Read in the input splitting on the new line
input = File.open("./example.txt").read.split("\n")

position = ""
directory_size = 0

find_actions = input.each_with_index do | line, index |
  if action = line["$ cd "]
    position.insert(-1,(line[-1].to_s))
  # unless
  #   line[-1] == "."
  #   position = position.pop
  #   # Pop my position off again
  elsif matches = line.match(/^(\d+)/)
    puts matches[1].to_i
    directory_size = directory_size+matches[1].to_i
  end
end

puts position
puts directory_size

# [{name: 'a', size: 88}, {name: 'a/e', size: 9}]