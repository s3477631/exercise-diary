Rails.application.routes.draw do
  resources :exercise_templates
  resources :routines
  devise_for :users

  get 'home/about'
  root 'exercise_templates#index'
end
