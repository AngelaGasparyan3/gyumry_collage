class Program < ApplicationRecord
  belongs_to :department
  validates :name, presence: true

  # Allow attaching an image for program card
  has_one_attached :image

  # Ransack allowlist for ActiveAdmin filters/search
  def self.ransackable_attributes(auth_object = nil)
    %w[id name description department_id created_at updated_at].freeze
  end

  def self.ransackable_associations(auth_object = nil)
    %w[department].freeze
  end
end
