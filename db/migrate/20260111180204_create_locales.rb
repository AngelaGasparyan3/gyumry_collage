class CreateLocales < ActiveRecord::Migration[6.0]
  def change
    create_table :locales do |t|
      t.string  :code, null: false, limit: 10
      t.string  :name, null: false
      t.boolean :enabled, default: true, null: false
      t.boolean :default_locale, default: false, null: false
      t.integer :position, default: 0, null: false

      t.timestamps
    end

    add_index :locales, :code, unique: true
    add_index :locales, :position
  end
end
