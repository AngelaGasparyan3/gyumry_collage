class AddI18nToPrograms < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :name_hy, :string
    add_column :programs, :name_en, :string
    add_column :programs, :description_hy, :string
    add_column :programs, :description_en, :string
    add_column :programs, :duration, :string unless column_exists?(:programs, :duration)

  end
end
