require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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


  scenario "Should see cart update when click Add to cart" do
  # ACT
  visit root_path
  within first('.actions') do 
    click_button 'Add'
  end

  # DEBUG
  save_screenshot("add_to_cart.png")

  # VERIFY
  expect(page).to have_text('My Cart (1)')
  end
end
