class Membership
  ALL = []

  attr_reader :lifter, :gym, :cost

  def initialize(lifter, gym, cost)
    @lifter = lifter
    @gym = gym
    @cost = cost
    ALL << self
  end

  def self.all
    ALL
  end


end
