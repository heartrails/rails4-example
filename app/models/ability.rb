class Ability
  include CanCan::Ability

  def initialize(user)
    can :access, :sessions
    can :read, :all
    can :create, :users
    if user
      can [:update, :destroy], :users, id: user.id
      can [:create, :update, :destroy], :posts, user_id: user.id
      can [:create, :update, :destroy], :comments, user_id: user.id
      can :destroy, :comments, post: {user_id: user.id}
    end
  end
end
