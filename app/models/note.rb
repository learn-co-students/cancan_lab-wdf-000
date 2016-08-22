class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(arg)
    # binding.pry
    arg.split(/,\s*/).each do |x|
      self.readers << User.find_or_create_by(name:x)
    end
  end

  def visible_to
    self.readers.collect{|x| x.name }.join(', ')
  end

end
