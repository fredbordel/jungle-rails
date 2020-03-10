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

    describe '.authenticate_with_credentials' do
      subject(:user) {
        User.create(
             first_name: 'Soph',
             last_name: 'Webber',
             email: 'some@email.com',
             password: 'password12',
             password_confirmation: 'password12'
        )
      }
    
      it 'should authenticate with right credentials' do
        auth_user = User.authenticate_with_credentials(user.email, user.password)
        expect(auth_user).to eq(user)
      end

      it 'should authenticate with space around email' do
        auth_user = User.authenticate_with_credentials(" #{user.email} ", user.password)
        expect(auth_user).to eq(user)
      end

      it 'should authenticate with wrong cased email' do
        auth_user = User.authenticate_with_credentials(user.email.upcase, user.password)
        expect(auth_user).to eq(user)
      end

      it 'should not authenticate if invalid credentials' do
        auth_user = User.authenticate_with_credentials('wow@wow.wow', 'whatever')
        expect(auth_user).to eq(nil)
      end

    end
end



