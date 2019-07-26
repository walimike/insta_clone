class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { minimum: 3, maximum:20 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true

    before_save :no_email_uppercase

    def no_email_uppercase
        email_string = email.partition('@').first
        email_string.downcase
    end
end
