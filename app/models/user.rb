class User < ActiveRecord::Base
  has_many :viewers
  has_many :readable, through: :viewers, source: :user
  has_many :readers, :through => :viewers, :source => :user
end
