class Feature < ApplicationRecord
	has_many :feature_houses, dependent: :destroy
	has_many :houses, through: :feature_houses, dependent: :destroy
end
