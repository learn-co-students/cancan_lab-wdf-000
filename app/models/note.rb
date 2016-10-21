class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    self.readers.collect do |reader|
      reader.name
    end.join(", ")
  end

  def visible_to=(arg)
    self.readers = arg.split(",").collect do |name|
      User.find_by(name: name.strip)
    end
  end

end
