class User < ApplicationRecord

	belongs_to :subsidiary

	enum role: { user: 0, admin: 1 }

	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :user
	end

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
