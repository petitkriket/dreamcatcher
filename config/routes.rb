Rails.application.routes.draw do
  resources :classfield_images
  resources :classfields
  root 'welcome#index'
end
