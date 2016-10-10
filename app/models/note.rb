class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :owner_can_read


  def visible_to
    self.readers.collect{|user| user.name}.join(', ')
  end

  def visible_to=(names)
    self.readers = names.split(',').collect do |name|
      User.find_by(name: name.strip)
    end
  end

  private

  def owner_can_read
    self.readers << self.user if self.user && !self.readers.include?(self.user)
  end
end
