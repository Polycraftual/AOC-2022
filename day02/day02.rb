input = File.readlines("./example.txt")

# Game States
# opp_rock = "A"
# opp_paper = "B"
# opp_scissors = "C"
# me_rock = "X"
# me_paper = "Y"
# me_scissors = "Z"

# Making a round
class Round
  attr_reader :opponent_action, :my_action
  def initialize (actions_as_string)
    actions = actions_as_string.split(" ")
    @opponent_action = actions[0]
    @my_action = actions[1]
  end

  def opponent_map
    {
      "A" => :rock,
      "B" => :paper,
      "C" => :scissors
    }
  end

  def me_map
    {
      "X" => :rock,
      "Y" => :paper,
      "Z" => :scissors
    }
  end

  def who_won
    opp = opponent_map[opponent_action]
    me = me_map[my_action]

    if opp == me
      return "draw"
    elsif opp == :rock && me == :paper
      return "win"
    elsif opp == :rock && me == :scissors
      return "lose"
    elsif opp == :paper && me == :rock
      return "lose"
    elsif opp == :paper && me == :scissors
      return "win"
    elsif opp == :scissors && me == :rock
      return "win"
    elsif opp == :scissors && me == :paper
      return "lose"
    end
  end

  def points
    me = me_map[my_action]

    score = 0
    if me == :rock
      score = score + 1
    elsif me == :paper
      score = score + 2
    elsif me == :scissors
      score = score + 3
    end

    if who_won == "win"
      score = score + 6
    elsif who_won == "draw"
      score = score + 3
    elsif who_won == "lose"
      score = score + 0
    end
    return score
  end
end

# Array of the rounds in the game
game = []

# For each round, split the input into opponent and my action
input.each_with_index do |actions_as_string, index|
  round = Round.new(actions_as_string)
  game.push(round)
end

#puts "#{game}"

# Map translating the letter codes to the traiditional actions
opponent_map = {
  "A" => :rock,
  "B" => :paper,
  "C" => :scissors
}

me_map = {
  "X" => :rock,
  "Y" => :paper,
  "Z" => :scissors
}

overall_points = game.map(&:points).sum


puts game[0].who_won
puts game[1].who_won
puts game[2].who_won
puts overall_points
