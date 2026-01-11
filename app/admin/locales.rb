ActiveAdmin.register Locale do
  permit_params :code, :name, :enabled, :position, :default_locale

  index do
    selectable_column
    id_column
    column :code
    column :name
    column :enabled
    column :default_locale
    column :position
    actions defaults: true do |loc|
      item "Set default", set_default_admin_locale_path(loc), method: :post if !loc.default_locale?
    end
  end

  form do |f|
    f.inputs do
      f.input :code, hint: "Two-letter code, e.g. 'hy', 'en'"
      f.input :name
      f.input :enabled
      f.input :default_locale
      f.input :position
    end
    f.actions
  end

  member_action :set_default, method: :post do
    resource.set_as_default!
    redirect_to admin_locales_path, notice: "Default locale updated."
  end
end
