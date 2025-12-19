ActiveAdmin.register SiteSetting do
  config.filters = false

  permit_params :site_name, :hero_caption, :hero_alt, :hero_image

  form html: { multipart: true } do |f|
    f.semantic_errors

    f.inputs "Site Settings" do
      f.input :site_name, label: "Site name"

      f.input :hero_image,
        as: :file,
        label: "Hero image",
        hint: (
          f.object.hero_image.attached? ?
            image_tag(
              url_for(f.object.hero_image),
              style: "max-width: 300px; display:block; margin-bottom:8px;"
            ) :
            content_tag(:span, "No hero image")
        )

      f.input :hero_alt, label: "Hero image alt text"
      f.input :hero_caption, as: :text, label: "Hero caption / text beside image"
    end

    f.actions
  end

  show do
    attributes_table do
      row :site_name

      row "Hero image" do |s|
        if s.hero_image.attached?
          image_tag url_for(s.hero_image), style: "max-width: 400px;"
        else
          status_tag "No image"
        end
      end

      row :hero_alt
      row :hero_caption
    end

    active_admin_comments
  end
end
