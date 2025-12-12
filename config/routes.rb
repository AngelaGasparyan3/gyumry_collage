Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users
  ActiveAdmin.routes(self) if defined?(ActiveAdmin)

  resources :departments, only: [:index, :show] do
    resources :programs, only: [:show]
  end

  post "/contact_messages", to: "contact_messages#create"

  get "/about", to: "pages#about"
  get "/student_life", to: "pages#student_life"
  get "/admissions", to: "pages#admissions"
end
