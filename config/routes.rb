Rails.application.routes.draw do
  root 'topics#index'
  resources :comments
  resources :topics
end
