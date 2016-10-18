class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :read


  def visible_to
    self.readers.map{|user| user.name}.join(', ')
  end

  def visible_to=(names)
    self.readers = names.split(',').collect do |name|
      User.find_by(name: name.strip)
    end
  end

  private

  def read
    if self.user && !self.readers.include?(self.user)
      self.readers << self.user
    end
  end
end
