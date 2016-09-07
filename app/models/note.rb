class Note < ActiveRecord::Base
  attr_reader :visible_to
  
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :make_owner_a_reader

  def visible_to
    readers.map { |reader| reader.name }.join(", ")
  end

  def visible_to=(viewers_names)
    self.readers = viewers_names.split(",").map do |viewer_name|
      User.find_by(name: viewer_name.strip)
    end.compact
  end

  def make_owner_a_reader
    readers << user if user && !readers.include?(user)
  end

end
