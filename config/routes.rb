Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "(:locale)", locale: /hy|en/ do
    root "pages#home"

    get "about", to: "pages#about"
    get "admissions", to: "pages#admissions"

    resources :programs, only: [:index]
    resources :departments, only: [:index, :show]

    # Online application form
    resources :application_forms, only: [:new, :create]
  end
end
