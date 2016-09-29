class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(string_of_names)
    # split names at comma and remove whitespace
    names = string_of_names.split(',').map(&:strip)

    names.each do |name|
      self.readers << User.find_by(name: name)
    end
  end

  def visible_to
    self.readers.map(&:name).join(', ')
  end

end
