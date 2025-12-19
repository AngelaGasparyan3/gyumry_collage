class AddDurationToPrograms < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :duration, :string
  end
end
