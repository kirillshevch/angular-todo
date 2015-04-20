class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, List, user_id: user.id
    else
      can :read, :all
    end
  end
end
