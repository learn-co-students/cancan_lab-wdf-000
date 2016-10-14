class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers.map(&:name).join(', ')
  end

  def visible_to=(names)
    names.split(', ').each do |n|
      readers << User.find_by(name: n)
    end
  end
end
