class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  accepts_nested_attributes_for :readers

  before_save :add_self_to_readers

  def visible_to
    readers.map(&:name).join(", ")
  end

  def visible_to=(reader_names)
    self.readers = reader_names.strip.split(/\s*,\s*/).map do |reader_name|
      User.find_by(name: reader_name)
    end
  end

  private

  def add_self_to_readers
    if user && !readers.include?(user)
      readers << user
    end
  end
end
