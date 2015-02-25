class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
  		can :manage, :all
	elsif user.coordinator?
  		can :read, Magazine
	elsif user.client?
  		can :read, Magazine
  else
      can :read, Magazine
	end

  end

end