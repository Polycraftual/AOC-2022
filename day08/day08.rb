rows = File.open("./example.txt").read.split("\n")
require 'byebug'

copse_width = rows[0].size
copse_height = rows.count

rows_as_trees = rows.map do |row, index|
  row.chars
end

r_visibility = rows_as_trees.map.with_index do | tree, index |
  if tree == rows_as_trees[-1]
    true
  else
    current_index = index
    visible = true
    while visible do
      break if current_index == copse_width-1
      puts "current: " + current_index.to_s
      next_taller = tree[current_index+1] >= tree[index]
      if next_taller
        visible = false
      else
        current_index = current_index+1
      end
    end
  end   
  visible 
end

puts copse_width
puts copse_height

pp rows_as_trees
pp r_visibility