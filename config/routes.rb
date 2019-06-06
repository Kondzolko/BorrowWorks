Rails.application.routes.draw do
  devise_for :users
  devise_for :models

  root :to => "home#index"

  post 'home/import_list/', to: 'home#import_list'
  post 'home/create_list/', to: 'home#create_list'
  post 'home/import_list_to_db/', to: 'home#import_list_to_db'
end
