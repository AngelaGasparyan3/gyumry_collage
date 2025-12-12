ActiveAdmin.register Department do
  # Permit nested attributes so ActiveAdmin can create/update programs with the department
  permit_params :name, :description, programs_attributes: [:id, :name, :description, :_destroy]

  # Friendly form with nested programs
  form do |f|
    # Use semantic_errors without arguments to avoid calling .keys on errors
    f.semantic_errors

    f.inputs "Բաժին" do
      f.input :name, label: "Անուն"
      f.input :description, label: "Նկարագիր"
    end

    f.inputs "Ծրագրեր (ներքև)" do
      # has_many will build new program inputs; accepts_nested_attributes_for must be set on the model
      f.has_many :programs, allow_destroy: true, new_record: "Ավելացնել ծրագիր" do |p|
        p.input :name, label: "Ծրագիր"
        p.input :description, label: "Նկարագիր"
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row("Անուն") { |d| d.name }
      row("Նկարագիր") { |d| simple_format d.description }
    end

    panel "Ծրագրեր" do
      table_for department.programs do
        column :name
        column :description do |prog|
          truncate(prog.description, length: 120)
        end
        column "Actions" do |prog|
          link_to "Edit", edit_admin_program_path(prog)
        end
      end
    end

    active_admin_comments
  end
end
