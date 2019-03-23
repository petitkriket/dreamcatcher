Rails.application.routes.draw do
  resources :classfield_images
  resources :classfields
  #get 'welcome/index'
  get 'classfields/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
