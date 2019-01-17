Rails.application.routes.draw do
  resources :people
  root 'people#index'
end
