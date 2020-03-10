require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
 # SETUP
before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      quantity: 10,
      price: 64.99,
      image: open_asset('apparel1.jpg')
    )
  end
end

scenario "They see details for specific product" do
  # ACT
  visit root_path
# first('.product_name').click
  within first('.actions') do 
    click_link 'Details'
  end

  # DEBUG
  save_screenshot("product_details.png")

  # VERIFY
  expect(page).to have_css '.product-detail'
end
end
