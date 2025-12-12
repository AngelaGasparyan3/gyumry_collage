class Department < ApplicationRecord
  has_many :programs, dependent: :destroy, inverse_of: :department

  validates :name, presence: true

  # Allow nested program attributes for the ActiveAdmin form
  accepts_nested_attributes_for :programs, allow_destroy: true

  # Ransack allowlist for ActiveAdmin filters/search (avoid exposing sensitive fields)
  def self.ransackable_attributes(auth_object = nil)
    %w[id name description created_at updated_at].freeze
  end

  def self.ransackable_associations(auth_object = nil)
    %w[programs].freeze
  end
end
