# frozen_string_literal: true

class Product < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_date :available_on
  validates_date :discontinue_on, on_or_after: :available_on, allow_blank: true

  def format_price
    number_with_delimiter(price, delimiter: ".")
  end
end
