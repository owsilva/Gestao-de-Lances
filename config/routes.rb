Rails.application.routes.draw do
  root 'home#index'

  resources :my_account
  resources :documents
  resources :reward
  resources :bets
  resources :contact_us
  resources :about_us
  resources :faq
  resources :auction_page, path: :auction

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end