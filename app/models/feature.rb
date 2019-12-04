class Feature < ApplicationRecord
	has_many :feature_houses
	has_many :houses, through: :feature_houses
end
