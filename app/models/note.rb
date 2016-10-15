class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  accepts_nested_attributes_for :readers

    
    def visible_to=(viewers)
      @reader = viewers.split(", ").map do |person|
        User.find_by(name: person)
      end
      self.readers = @reader
    end


    def visible_to
      @result = self.readers.map do |person|
        person.name
      end
      @result.join(", ")
    end



end
