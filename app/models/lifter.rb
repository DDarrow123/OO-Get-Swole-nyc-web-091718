
class Lifter
  @@all = []


  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    self.class.all << self
  end

  def self.all
    @@all
  end

  def sign_up(cost, gym)
    #Create membership
    Membership.new(self, gym, cost)
  end

  def memberships
    #Access membership => [memberships]
    #Select all memberships for specific member
    Membership.all.select do |m|
      #compare whether or not lifter property == this lifter
      m.lifter == self
    end
  end

  def gyms
    #Access the Memberships.all array
    #Determine whether or not the memberships are mine/lifters
    my_memberships = self.memberships
    #create array of gyms from the memberships array
    my_memberships.map do |m|
      m.gym
    end
  end

  def self.average_lift
    total_weight = 0
    all_lifters =  self.all.inject(0) do |result, l|
    result + l.lift_total
    end
    all_lifters / self.all.size
  end

  def total_cost
    total_mem_sum = 0
    self.memberships.select do |m|
      total_mem_sum += m.cost
    end
    total_mem_sum
  end

# arr.inject(0.0) { |sum, el| sum + el } / arr.size
end
