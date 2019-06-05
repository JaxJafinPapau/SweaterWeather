class User < ApplicationRecord
  validates_presence_of :email,
                        :api_key
  has_many :favorites
  has_secure_password
end
