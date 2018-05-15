class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true, confirmation: true, password: true, on: :create
  validates :password, allow_blank: true, confirmation: true, password: true, on: :update
  validates :password_confirmation, presence: true, if: Proc.new { |user| user.password.present? }
end
