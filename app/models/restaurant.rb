class Restaurant < ActiveRecord::Base

  validates :name, :street1, :city, :zip, :owner, presence: true
  validates :state, presence: true, length: { maximum: 2 }

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id,
    inverse_of: :restaurants
  )

  has_many :tags
  
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  
  has_many :ratings, dependent: :destroy

  has_attached_file :avatar, styles: { :thumb => "100x100>", :full => "200x200>" }, :default_url => ActionController::Base.helpers.asset_path("restaurant.png")
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  geocoded_by :address

  def address
    [street1, city, state].compact.join(', ')
  end

  after_validation :geocode #, :if => :address_changed?

  include PgSearch

  multisearchable against: [:name]

  def comments_by_parent
    comments_by_parent = Hash.new { |hash, key| hash[key] = [] }
    comments.each do |comment|
      comments_by_parent[comment.parent_comment_id] << comment
    end
    
    comments_by_parent
  end

  def full_address
    address = "#{street1} #{city} #{zip}"
  end

  def average_rating_num
    average_rating = 0.0
    tot_rating = 0.0

    ratings.each do |rate|
      unless rate.rating.nil?
        average_rating += rate.rating.to_f
        tot_rating += 1
      end
    end

    return average_rating/tot_rating
  end

  def average_rating
    average_rating = 0.0
    tot_rating = 0.0

    ratings.each do |rate|
      unless rate.rating.nil?
        average_rating += rate.rating.to_f
        tot_rating += 1
      end
    end

    average_rating = average_rating/tot_rating

    stars = []

    if average_rating == 0
      stars = [""]
    elsif average_rating <= 0.5
      stars = ["fa fa-half-star"]
    elsif average_rating <= 1.0
      stars = ["fa fa-star"]
    elsif average_rating <= 1.5
      stars = ["fa fa-star", "fa fa-star-half"]
    elsif average_rating <= 2.0
      stars = ["fa fa-star", "fa fa-star"]
    elsif average_rating <= 2.5
      stars = ["fa fa-star", "fa fa-star", "fa fa-star-half"]
    elsif average_rating <= 3.0
      stars = ["fa fa-star", "fa fa-star", "fa fa-star"]
    elsif average_rating <= 3.5
      stars = ["fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star-half"]
    elsif average_rating <= 4.0
      stars = ["fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star"]
    elsif average_rating <= 4.5
      stars = ["fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star-half"]
    elsif average_rating == 5.0
      stars = ["fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star", "fa fa-star"]
    else
      stars = [""]
    end

    return stars
  end

end
