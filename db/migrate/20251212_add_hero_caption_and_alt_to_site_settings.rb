class AddHeroCaptionAndAltToSiteSettings < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:site_settings, :hero_alt)
      add_column :site_settings, :hero_alt, :string
    end

    unless column_exists?(:site_settings, :hero_caption)
      add_column :site_settings, :hero_caption, :text
    end
  end
end
