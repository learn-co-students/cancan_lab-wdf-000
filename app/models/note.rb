class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to
    self.readers.map(&:name).join(", ")
  end

  def visible_to=(viewers)
    self.readers = viewers.split(", ").map { |viewer| User.find_or_create_by(name: viewer) }
  end

  private
  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
