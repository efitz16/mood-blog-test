class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password_digest, presence: true

	validates_length_of :password, :minimum => 6, :too_short => "Password must be at least 6 characters long."

	validates_format_of :password, :with => /\d/, :message => "Must include one number"
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	before_save :downcase_email

	has_secure_password

  private

   def downcase_email
    self.email == email.downcase
   end
end
