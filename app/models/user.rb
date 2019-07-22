class User < ApplicationRecord
    validates :name,  presence: true, length: { minimum: 3, maximum:20 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true
end
