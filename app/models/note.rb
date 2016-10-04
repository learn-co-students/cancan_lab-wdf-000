class Note < ActiveRecord::Base

    belongs_to :user

    has_many :viewers
    # has_many :readers, through: :viewers, source: :user
    has_many :readers, -> {order "name ASC"}, :through => :viewers, :source => :user

    def visible_to=(people)
      # binding.pry
      name = ""
      people.split(",").each do |l|
        name = l.gsub(/\s+/, "")
        self.readers << User.find_or_create_by(:name => name)
      end
      self.readers
    end


    def visible_to

      array = []
      self.readers.each do |n|
        array << n.name
        end
        array.join(", ")
    end




end
