Rails.application.routes.draw do
  resources :classfield_images
  resources :classfields
  root 'classfields#index'
  get "/template" => "pages#index"

end
