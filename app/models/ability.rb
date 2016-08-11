class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note do |note|
      note.readers.include?(user) || user.notes.include?(note)
    end
    can :create, Note
    can :update, Note, :user => user
  end
end
