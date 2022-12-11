rows = File.open("./example.txt").read.split("\n")
require 'byebug'

copse_width = rows[0].size
copse_height = rows.count

horizontal_forest = rows.map do |row, index|
  row.chars
end

vertical_forest = []
copse_height.times do
  vertical_forest.push([])
end

rows.each do | row |
  row.chars.each_with_index do | tree, index |
    vertical_forest[index].push(tree)
  end
end

l_visibility = horizontal_forest.map.with_index do | row_of_trees, index |
  row_of_trees.map.with_index do | tree, i |
    current_index = i
    visible = true
    while visible do
      break if current_index == 0
      next_taller = row_of_trees[current_index-1] >= tree
      if next_taller
        visible = false
      else
        current_index = current_index-1
      end
    end
    visible
  end
end

r_visibility = horizontal_forest.map.with_index do | row_of_trees, index |
  row_of_trees.map.with_index do | tree, i |
    current_index = i
    visible = true
    while visible do
      break if current_index == copse_width-1
      next_taller = row_of_trees[current_index+1] >= tree
      if next_taller
        visible = false
      else
        current_index = current_index+1
      end
    end
    visible
  end
end

t_visibility = vertical_forest.map.with_index do | row_of_trees, index |
  row_of_trees.map.with_index do | tree, i |
    current_index = i
    visible = true
    while visible do
      break if current_index == 0
      next_taller = row_of_trees[current_index-1] >= tree
      if next_taller
        visible = false
      else
        current_index = current_index-1
      end
    end
    visible
  end
end

b_visibility = vertical_forest.map.with_index do | row_of_trees, index |
  row_of_trees.map.with_index do | tree, i |
    current_index = i
    visible = true
    while visible do
      break if current_index == copse_width-1
      next_taller = row_of_trees[current_index+1] >= tree
      if next_taller
        visible = false
      else
        current_index = current_index+1
      end
    end
    visible
  end
end

# puts copse_width
# puts copse_height

pp horizontal_forest
pp vertical_forest
pp r_visibility.flatten.count(true)
pp l_visibility.flatten.count(true)
pp t_visibility.flatten.count(true)
pp b_visibility.flatten.count(true)