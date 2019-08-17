class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { minimum: 3, maximum:20 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    before_save :no_email_uppercase

    def no_email_uppercase
        email_string = email.partition('@').first
        email_string.downcase
    end

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

  # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end
end
