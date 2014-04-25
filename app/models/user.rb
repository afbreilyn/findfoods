class User < ActiveRecord::Base

	attr_reader :password

	before_validation :ensure_session_token

	validates :password_digest, :fname, :lname, :city, :presence => true
	validates :password, length: { minimum: 6, allow_nil: true }
	validates :session_token, :email, presence: true, uniqueness: true
	validates :state, presence: true, length: { maximum: 2 }

	has_many(
		:restaurants,
		class_name: "Restaurant",
		foreign_key: :owner_id,
		primary_key: :id
	)
	
	has_many(
		:tags,
		class_name: "Tag",
		foreign_key: :author_id,
		primary_key: :id
	)

	has_many :comments, as: :commentable, dependent: :destroy
  has_many :notifications, inverse_of: :user, dependent: :destroy
	has_many :ratings, dependent: :destroy
	
	has_many(
		:searches,
		class_name: "Search",
		foreign_key: :user_id,
		primary_key: :id
	)

	#has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



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
