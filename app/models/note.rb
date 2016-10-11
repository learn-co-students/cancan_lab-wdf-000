class Note < ActiveRecord::Base

  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  accepts_nested_attributes_for :readers

  def visible_to
    # binding.pry
    a = []
    self.readers.each do |r|
      a << r.name
    end
    a.join(", ")
    # self.readers.pluck(:name).join(", ")
  end

  def visible_to=(names)
    # binding.pry
    self.readers = names.split(", ").map do |n|
      User.find_by(name: n)
    end.compact
    # binding.pry
    # names.each do |n|
    #   user = User.find_by(name: n)
    #   self.readers << user if user
    # end
    # binding.pry
    # self.readers.sort!
    # self.readers <<
  end


end
