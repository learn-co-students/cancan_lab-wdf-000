class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers.map {|reader| reader.name}.join(', ')
  end

  def visible_to=(viewers)
    viewers.split(', ').each do |viewer|
      readers << User.find_by(name: viewer)
    end
  end
end
