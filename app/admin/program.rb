ActiveAdmin.register Program do
  remove_filter :image
  remove_filter :image_attachment
  remove_filter :image_blob

  filter :name
  filter :department, as: :select, collection: proc { Department.pluck(:name, :id) }

  permit_params :name, :description, :department_id, :image, :duration

  index do
    selectable_column
    id_column
    column "Բաժին", :department
    column :name
    column :description do |p|
      truncate(p.description, length: 80)
    end
    column "Պատկեր" do |p|
      if p.image.attached?
        # Use the full blob URL (no variant). Variants require image_processing gem.
        image_tag url_for(p.image), style: "max-width:100px; height: auto;"
      else
        status_tag "Չկա"
      end
    end
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs "Ծրագիր" do
      f.input :department, label: "Բաժին"
      f.input :name, label: "Անուն"
      f.input :description, label: "Նկարագիր"
      f.input :duration, label: "Տևողություն"
      f.input :image, as: :file, label: "Պատկեր (Image)", hint: f.object.image.attached? ? image_tag(url_for(f.object.image), style: "max-width: 200px;") : content_tag(:span, "Չկա պատկերը")
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row("Բաժին") { |p| p.department&.name }
      row :name
      row :description
      row("Պատկեր") do |p|
        if p.image.attached?
          image_tag url_for(p.image), style: "max-width: 400px;"
        else
          status_tag "Չկա"
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
