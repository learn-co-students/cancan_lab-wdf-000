class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  accepts_nested_attributes_for :readers


    def visible_to=(viewers)
      viewer = viewers.split(", ")
      viewer.map do |person|
        reader = User.find_by(name: person)
          self.readers << reader
      end
    end


    def visible_to
      @result = self.readers.map do |person|
        person.name
      end
      @result.join(", ")
    end



end
