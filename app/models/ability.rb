class Ability < ActiveRecord::Base
  include CanCan::Ability

  def initialize(user)
    if user

      can :manage, Note, {user_id: user.id}
      can :read, Note do |note|
        note.readers.include?(user)
      end
    end
  end
end
