# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    ActiveAdmin.register_page "Dashboard" do
  content do
    columns do
      column do
        panel "Applications count" do
          h3 ApplicationForm.count
        end
      end

      column do
        panel "Programs count" do
          h3 Program.count
        end
      end

      column do
        panel "Departments count" do
          h3 Department.count
        end
      end
    end

    panel "Latest applications" do
      table_for ApplicationForm.order(created_at: :desc).limit(5) do
        column :full_name
        column :department
        column :created_at
      end
    end
  end
end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
