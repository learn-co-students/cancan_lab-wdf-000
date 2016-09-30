class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note do |note|
      note.readers.include?(user) || note.user_id == user.id
    end
    unless user.nil?
      can :create, Note
      can :update, Note, user_id: user.id
    end
  end

end
