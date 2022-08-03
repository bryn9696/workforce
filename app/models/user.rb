class User < ApplicationRecord
  has_secure_password
  has_one :organisation
  has_many :shifts
end