class User < ApplicationRecord
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
end
