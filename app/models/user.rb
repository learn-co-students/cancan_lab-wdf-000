class User < ActiveRecord::Base
  @@current = nil
  has_many :viewers
  has_many :readable, through: :viewers, source: :note
  has_many :notes

  def self.current
    @@current
  end

  def self.current=(user_id)
    @@current = self.find_by(id: user_id)
  end
end
