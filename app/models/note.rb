class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	has_many :readers, through: :viewers, source: :user

	# accepts_nested_attributes :visible_to
	before_save :add_owner

	def visible_to
		self.readers.map { |user| user.name }.join(", ")
	end

	def visible_to=(viewers)
		self.readers = viewers.split(",").map { |viewer| User.find_by(name: viewer.strip) }.compact
	end

	def add_owner
		if self.user && !self.readers.include?(user)
			self.readers << user
		end
	end


end
