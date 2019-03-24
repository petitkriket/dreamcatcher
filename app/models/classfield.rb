class Classfield < ApplicationRecord
	has_many :classfield_images, dependent: :destroy
	validates :offer_id, presence: true,  uniqueness: true
end
