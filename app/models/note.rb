class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, -> {order "name ASC"}, through: :viewers, source: :user
  belongs_to :user

  def visible_to
    array = []
    self.readers.each do |user|
      array << user.name
    end
    array.join(", ")
  end

  def visible_to=(users)
    users.split(', ').each do |username|
      self.readers << User.find_or_create_by(name: username)
    end
    self.readers
  end
end
