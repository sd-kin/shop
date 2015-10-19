class StoreController < ApplicationController

	include UseCount
	include CurrentCart

	before_action :set_count, only: [:index]
	before_action :set_cart, only: [:index]

  def index
  	@products = Product.order(:title)
  end
end
