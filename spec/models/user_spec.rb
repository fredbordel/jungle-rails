require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    user_subject {
      User.new(first_name: 'First',
               last_name: 'Last',
               email: 'something@email.com',
               password: 'password',
               password_confirmation: 'password')
    }

      it 'is valid with all valid attributes' do
        expect(user_subject).to be_valid
      end

  end
end



# it is not valid without an email
# it is not valid without a unique email // not case sensitive
# it is not valid without a first name
# it is not valid without a last name
# it is not valid without a password
# it is not valid without a confirmation-password
# it is not valid if password != confirmation-password
# it is not valid if password length is < than 3

