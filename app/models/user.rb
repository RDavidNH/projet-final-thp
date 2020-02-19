class User < ApplicationRecord
  # after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, 
         :omniauth_providers => [:facebook, :google_oauth2]
# :omniauth_providers => [:facebook, :google_oauth2]
  # devise :omniauthable, omniauth_providers: %i[facebook]
  has_one_attached :avatar
  belongs_to :city, optional: :true
  has_many :user_provider, dependent: :destroy
  has_one :testimonial, dependent: :destroy
  has_many :houses, dependent: :destroy
  has_many :comments, through: :houses, dependent: :destroy

  # def change_post_user_status
  #     self.can_post = true
  #     self.post_count = 0
  #     self.save
  # end
  def isGold
    self.can_post = true
    self.offer_type = "gold"
    self.post_count = self.post_count + 3
    self.save
  end


  def isRuby
    self.can_post = true
    self.offer_type = "ruby"
    self.post_count = self.post_count + 6
    self.save
  end

  
  def isDiamond
    self.can_post = true
    self.offer_type = "diamond"
    self.post_count = self.post_count + 15
    self.save
  end

  def set_user_role_to_owner
    self.role = "owner"
    self.save
  end

	
	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	end

end
