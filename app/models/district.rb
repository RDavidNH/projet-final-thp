class District < ApplicationRecord
	belongs_to :city
	has_many :houses, dependent: :destroy
end
