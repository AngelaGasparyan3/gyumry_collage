ActiveAdmin.register ApplicationForm do
  actions :index, :show, :destroy

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :phone
    column :department
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :full_name
      row :email
      row :phone
      row :department
      row :message
      row :created_at
    end
  end
end
