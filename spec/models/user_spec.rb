require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      User.new(first_name: 'First',
               last_name: 'Last',
               email: 'something@email.com',
               password: 'password',
               password_confirmation: 'password')
    }

      it 'is valid with all valid attributes' do
        expect(subject).to be_valid
      end

      it 'is not valid without an email' do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a first name' do
        subject.first_name = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a last name' do
        subject.last_name = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a password with minimum 3 char' do
        subject.password = nil || subject.password = 'ab'
        expect(subject).to_not be_valid
      end

      it 'is not valid if password_confirmation != password' do
        subject.password_confirmation = 'somethingelse'
        expect(subject).to_not be_valid
      end
  end
end



