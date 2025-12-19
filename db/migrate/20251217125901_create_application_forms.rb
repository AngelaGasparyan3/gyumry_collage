class CreateApplicationForms < ActiveRecord::Migration[7.1]
  def change
    create_table :application_forms do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :department
      t.text :message

      t.timestamps
    end
  end
end
