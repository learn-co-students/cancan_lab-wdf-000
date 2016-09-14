class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  accepts_nested_attributes_for :readers

  def visible_to
    self.readers.collect{|reader| reader.name}.join(", ")
  end

  def visible_to=(csv_list_of_names)
    self.readers = csv_list_of_names.split(/\,\s?/).collect do |name|
       User.find_or_create_by(name: name)
    end
    self.save
  end

end
