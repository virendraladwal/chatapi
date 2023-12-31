Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



  namespace :bx_block_messages do
   resources :messages
  end 


  namespace :bx_block_conversations do
   resources :conversations
  end 

  namespace :bx_block_users do
   resources :users, except: [:new, :edit]
  end 

  namespace :bx_block_booking_details do
    # resources :users do
     resources :booking_details
    # end 
  end 

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
  