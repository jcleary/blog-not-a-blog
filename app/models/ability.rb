class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Artifact, user_id: user.id
    can :manage, Collection, user_id: user.id

    can :manage, User
  end
end
