class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, :source => :user
  belongs_to :user

  before_save :add_user_to_readers

  def visible_to
    readers.map(&:name).join(", ")
  end

  def visible_to=(comma_separated_list)
    names = comma_separated_list.strip.split(", ")
    # this fails if self is not explicit
    self.readers = names.map {|name| User.find_by(name: name)}
  end

  def add_user_to_readers
    if user && !readers.include?(user)
      readers.push(user)
    end
  end
end
