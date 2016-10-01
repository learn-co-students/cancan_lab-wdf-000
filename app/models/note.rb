class Note < ActiveRecord::Base
  # attr_reader :readers
  has_many :viewers
  has_many :readers, -> {order "name ASC"}, through: :viewers, source: :user
  belongs_to :user

  before_save :add_owner_to_readers

  def visible_to 
    names_array = []
    self.readers.each {|u| names_array << u.name }
    names_array.join(', ')
  end

  def visible_to=(users)
    users_array = users.split(', ')
    users_array.each {|u| self.readers << User.find_by(name: u)}
    self.readers
  end

  def add_owner_to_readers
    readers << user if user && !readers.include?(user)
  end

end
