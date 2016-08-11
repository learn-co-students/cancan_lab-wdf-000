class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :add_user_to_readers

  def visible_to
    self.readers.map(&:name).join(', ')
  end

  def visible_to=(viewers)
    self.readers = viewers.split(', ').map {|v| User.find_by(name: v)}
  end

  def add_user_to_readers
    if self.user && !self.readers.include?(user)
      self.readers << user
    end
  end

end
