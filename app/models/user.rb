class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, confirmation: { case_sensitive: false }
  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true

  # before_save do
  #   self.email = email.downcase
  # end

  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email email.strip
    return user if user && user.authenticate(password)
    nil
end

end
