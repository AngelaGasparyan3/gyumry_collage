class SiteSetting < ApplicationRecord
  # Attachments
  has_one_attached :hero_image

  # Ensure a singleton instance convenience method
  def self.instance
    # Use first_or_create so there's always a record to attach to
    first_or_create!(site_name: "Գյումրու Պետական Տեխնիկական Քոլեջ")
  end

  # Provide ransack safe methods if Admin uses filters (similar to AdminUser fix)
  def self.ransackable_attributes(auth_object = nil)
    %w[id site_name hero_alt created_at updated_at].freeze
  end

  def self.ransackable_associations(auth_object = nil)
    [].freeze
  end
end
