Rails.application.routes.draw do
  root 'passwords#new'
  get 'new_password', to: 'passwords#new', as: :new_password
  post 'generate_password', to: 'passwords#generate'
end
