class CreateSiteSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :site_settings do |t|
      t.string :site_name
      t.string :hero_alt

      t.timestamps
    end
  end
end
