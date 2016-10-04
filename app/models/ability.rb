class Ability
  include CanCan::Ability

    #  include CanCan::Ability

     def initialize(user)
       unless user.nil?
        can :manage, Note, {user_id: user.id}

        can :read, Note do |note|
          note.readers.include?(user) || note.user_id == user.id
        end
       end
     end

  # def initialize(user)

    # can :read, Note do |note|
    # end
    #
    # if note.viewers.include?(user)
    #   can :read, :user
    # end

    # can :read, Note, :viewer => true, :user_id => user.id

    #
    #
    #
    #
    # can :create, Note
    # # can :update, Note
    # unless user.nil? # guest
    #   # CanCan accepts a hash of conditions;
    #   # here, we're saying that the Post's user_id
    #   # needs to match the requesting User's id
    #   # can :read, Note, viewer_id: user.id
    #
    #   can :read, Note, { user_id: user.id }
    #   can :update, Note, { user_id: user.id }
    # end

    # if
    # can :read, Note do |note|
    # end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  # end
end
