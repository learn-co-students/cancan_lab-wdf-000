class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :owner_can_read

  def visible_to
    self.readers.map{|reader| reader.name}.join(", ")
  end

  def visible_to=(viewer_names)
    self.readers = viewer_names.split(',').map do |viewer_name|
      User.find_by(name: viewer_name.strip)
    end.compact
    # byebug
  end

  private

  def owner_can_read
    self.readers << user if user && !self.readers.include?(user)
  end
end
