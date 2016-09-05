class Note < ActiveRecord::Base
	belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user


  def visible_to
    readers.map { |reader| reader.name }.join(", ")
  end

  def visible_to=(attr)
    attr.split(", ").each do |name| 
      self.readers << User.find_by(name: name)
    end
  end
end
