# Read in the input splitting on the new line
input = File.open("./input.txt").read.split("\n")

$directories = []

class Directory
  attr_reader :name, :parent, :children
  def initialize (name, parent)
    @name = name
    @parent = parent
    @children = []
  end

  def to_s
    "My name is #{name} and my children are #{children.map(&:to_s)}, my size is #{size}"
  end

  def size
    my_size = children.map(&:size).sum
    if my_size < 100000
      $directories.push(my_size)
    end
    my_size
  end
end

class Item
  attr_reader :name, :parent, :size
  def initialize (name, parent, size)
    @name = name
    @parent = parent
    @size = size.to_i
  end
end

root = Directory.new("/", nil)

current_directory = root

actions = input.each_with_index do | line, index |
  if action = line["$ cd "]
    target_directory = line[5..-1]
    if target_directory == "/"
      current_directory = root
    elsif target_directory == ".."
      if current_directory == root
        raise "WARNING! You can go no higher."
      end
      current_directory = current_directory.parent
    else
      new_directory = Directory.new(target_directory, current_directory)
      current_directory.children.push(new_directory)
      current_directory = new_directory
    end
  elsif line.match(/^(\d+)/)
    new_file = Item.new(line.split(" ")[1], current_directory,line.split(" ")[0])
    current_directory.children.push(new_file)
  end
end

root_size = root.size

pp $directories.sum
