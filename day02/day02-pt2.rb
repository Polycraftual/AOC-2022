input = File.readlines("./input.txt")

# Game States
# opp_rock = "A"
# opp_paper = "B"
# opp_scissors = "C"
# me_lose = "X"
# me_draw = "Y"
# me_win = "Z"

# Making a round
class Round
  attr_reader :opponent_action, :outcome
  def initialize (actions_as_string)
    actions = actions_as_string.split(" ")
    @opponent_action = actions[0]
    @outcome = actions[1]
  end

  def opponent_map
    {
      "A" => :rock,
      "B" => :paper,
      "C" => :scissors
    }
  end

  def outcome_map
    {
      "X" => "lose",
      "Y" => "draw",
      "Z" => "win"
    }
  end

  def my_action
    opp = opponent_map[opponent_action]
    out = outcome_map[outcome]

    if out == "draw"
      return opp
    elsif opp == :rock && out == "lose"
      return :scissors
    elsif opp == :rock && out == "win"
      return :paper
    elsif opp == :paper && out == "lose"
      return :rock
    elsif opp == :paper && out == "win"
      return :scissors
    elsif opp == :scissors && out == "lose"
      return :paper
    elsif opp == :scissors && out == "win"
      return :rock
    end
  end

  def points
    out = outcome_map[outcome]

    score = 0
    if my_action == :rock
      score = score + 1
    elsif my_action == :paper
      score = score + 2
    elsif my_action == :scissors
      score = score + 3
    end

    if out == "win"
      score = score + 6
    elsif out == "draw"
      score = score + 3
    elsif out == "lose"
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


puts game[0].my_action
puts game[1].my_action
puts game[2].my_action
puts overall_points
