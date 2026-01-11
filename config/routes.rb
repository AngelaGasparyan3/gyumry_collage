Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "(:locale)", locale: /hy|en/ do
    root "pages#home"

    get "about", to: "pages#about"
    get "admissions", to: "pages#admissions"

    resources :programs, only: [:index]
    # resources :departments, only: [:index, :show]
    resources :departments, only: [:index, :show] do
  resources :programs, only: [:show]
end
get 'student_life', to: 'pages#student_life', as: 'student_life'


    # Online application form
    resources :application_forms, only: [:new, :create]
  end
end
