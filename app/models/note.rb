class Note < ActiveRecord::Base

  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  def visible_to=(string)
    self.readers = string.split(", ").map{|name| User.find_or_create_by(name: name)}
  end

  def visible_to
    self.readers.map(&:name).join(", ")
  end

end
