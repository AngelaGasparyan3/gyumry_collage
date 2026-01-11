class Locale < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :enabled, -> { where(enabled: true).order(:position) }

  after_save :ensure_single_default, if: :saved_change_to_default_locale?

  def self.default
    find_by(default_locale: true)
  end

  def self.enabled_codes
    enabled.pluck(:code).map(&:to_s)
  end

  def set_as_default!
    transaction do
      Locale.where(default_locale: true).update_all(default_locale: false)
      update!(default_locale: true, enabled: true)
    end
  end

  private

  def ensure_single_default
    if default_locale
      Locale.where.not(id: id).where(default_locale: true).update_all(default_locale: false)
      update_column(:enabled, true) unless enabled?
    end
  end
end
