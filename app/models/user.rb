# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password validations: false
  before_save :downcase_email

  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, password_strong: true, on: :create
  validates :password, allow_blank: true, confirmation: true, password_strong: true, on: :update

  def downcase_email
    self.email = email.downcase
  end

  def forget_password
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    Secure.authenticated? digest, token
  end
end
