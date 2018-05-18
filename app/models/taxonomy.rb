# frozen_string_literal: true

class Taxonomy < ApplicationRecord
  validates :name, presence: true, length: { in: 2..20 }, uniqueness: { case_sensitive: false }
  validates :code, presence: true, length: { in: 2..10 }, uniqueness: { case_sensitive: false }
  validates :position, presence: true,
                       numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
