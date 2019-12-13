class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  belongs_to :city, optional: :true
  has_one :testimonial
  has_many :houses
  has_many :comments, through: :houses
end
