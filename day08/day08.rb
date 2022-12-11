rows = File.open("./input.txt").read.split("\n")
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

# Compare the L-R visibility
horizontal_visibility = []
l_visibility.each_with_index do | row, index |
  row.each_with_index do | tree, i |
    if tree == true
      horizontal_visibility.push(tree)
    else
      if r_visibility[index][i] == true
        horizontal_visibility.push(true)
      else
        horizontal_visibility.push(tree)
      end
    end
  end
end

# Compare the T-B visibility
vertical_visbility = []
t_visibility.each_with_index do | row, index |
  row.each_with_index do | tree, i |
    if tree == true
      vertical_visbility.push(tree)
    else
      if b_visibility[index][i] == true
        vertical_visbility.push(true)
      else
        vertical_visbility.push(tree)
      end
    end
  end
end

pp horizontal_forest
pp vertical_forest

moo = []
horizontal_visibility.each_slice(copse_width).map do |slice|
  moo.push(slice)
end

hey = []
vertical_visbility.each_slice(copse_height).map do |slice|
  hey.push(slice)
end

baa = []
copse_height.times do
  baa.push([])
end

hey.each do | row |
  row.each_with_index do | visibility, index |
    baa[index].push(visibility)
  end
end

# Compare the overall visibility
overall_visbility = []
moo.each_with_index do | row, index |
  row.each_with_index do | tree, i |
    if tree == true
      overall_visbility.push(tree)
    else
      if baa[index][i] == true
        overall_visbility.push(true)
      else
        overall_visbility.push(tree)
      end
    end
  end
end

pp overall_visbility.count(true)