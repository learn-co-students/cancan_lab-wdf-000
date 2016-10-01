
class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can :manage, Note, user_id: user.id

    can :read, Note do |note|
        note.user_id == user.id || note.readers.include?(user)
    end

  end

end
