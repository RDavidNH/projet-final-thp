class House < ApplicationRecord
	belongs_to :user
	belongs_to :district
	belongs_to :type
	has_many :feature_houses
	has_many :features, through: :feature_houses
end
