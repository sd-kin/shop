require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@product_data = { title: 'title',
  	 					description: 'description',
  	 					image_url: 'image.gif',
  	 					price: 10}
  end

  def new_product(image_url)
  	product = Product.new @product_data
  	product.image_url = image_url
  	product
  end

  test 'product attributes must not be empty' do
  	product = Product.new
  	assert product.invalid?, 'empty product valid'
  	assert product.errors[:title].any?, 'empty product has no title error message'
  	assert product.errors[:description].any?, 'empty product has no description error message'
  	assert product.errors[:image_url].any?, 'empty product has no image url error message'
  	assert product.errors[:price].any?, 'empty product has no price error message'
  end

  test 'product price must be greater then zero' do
	  product = Product.new @product_data
	  
	  product.price=-1
	  assert product.invalid?, 'product price can be less than zero'
	  assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

	  product.price=0
	  assert product.invalid?, 'product price can be zero'
	  assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

	  product.price=1
	  assert product.valid?, 'valide product price dont pass validation'

end

test 'image url must be valid' do

	valid_urls = %w{file.jpg file.jpeg d:/image/blah/image.png}
	not_valid_urls = %w{file.js file.bat file.raw d:/image/blah/image.doc}

	valid_urls.each do |url|
		assert new_product(url).valid?, "#{url} should be valid"
	end

	not_valid_urls.each do |url|
		assert new_product(url).invalid?, "#{url} should not be valid"
	end

end

test 'title shold be uniq' do

product = Product.new @product_data
product.title = products(:ruby).title

assert product.invalid?, 'products whith nonunique titles should be invalid'

assert_equal ['has already been taken'], product.errors[:title], 'unexpected error message'
end


end #end 0f tests
