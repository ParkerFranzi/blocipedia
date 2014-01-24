class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    # if a member, they can manage their own posts 
    # (or create new ones)
    if user.role? :member
      can :manage, Post, :user_id => user.id
    end

    # Premium Member
    if user.role? :premium
      #can :edit, user.shared_posts
      can :make_private, User
    end

    # Moderators can delete any post
    if user.role? :moderator
      can :destroy, Post
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, Post, public: true

  end
end