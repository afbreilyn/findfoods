class User < ActiveRecord::Base

	before_validation :ensure_session_token

	validates :password_digest, :presence => true
	#validates :password, :length => { :minimum => 6, :allow_bil => true }
	validates :sesion_token, :presence => true, :uniqueness => true
	validates :email, :presence => true, :uniqueness => true
	validates :fname, :presence => true
	validates :lname, :presence => true
	validates :city, :presence => true
	validates :state, :presence => true

	def self.find_by_credentials(email, password)
		user = User.find_by_email(email)
		user.try(:is_password?, password) ? user : nil
	end

	def is_password?(secret)
		BCrypt::Password.new(self.password_digest).is_password?(secret)
	end

	def password=(unencrypted_password)
		if unencrypted_password.present?
			@password = unencrypted_password
			self.password_digest = BCrypt::Password.create(unencrypted_password)
		end
	end

	def reset_session_token!(force = true)
		self.session_token = SecureRandom.urlsafe_base64(16)
		self.save!
		self.session_token
	end

	private

	def ensure_session_token
		self.session_token ||= SecureRandom.urlsafe_base64(16)
	end

end
