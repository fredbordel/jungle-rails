require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject {
      Product.new(name: "Name",
                  price_cents: 25,
                  quantity: 3,
                  category: Category.new)
    }
    
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a category' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

  end
end