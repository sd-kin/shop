class Product < ActiveRecord::Base
	validates :title, :description, :image_url, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :description, length: {minimum: 10}, allow_blank: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(jpg|jpeg|gif|png)\Z}i,
		message: 'URL должен указывать на gif, jpeg или png'
	}
end
