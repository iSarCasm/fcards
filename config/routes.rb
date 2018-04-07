Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'decks#index'
  
  resources :decks, only: [:index, :show, :new, :create] do
    member do
      get :repeat_distributed
      get :repeat_orderly
      get :repeat_random
    end

    resources :cards, only: [:show, :new, :edit, :create, :update] do
      member do
        get :answer
        post :right
        post :wrong
      end
    end
  end

  resource :repeat_session, only: [:new, :create] do
    resources :cards, only: [:show, :destroy], controller: 'session_cards' do
      member do
        get :answer
        post :right
        post :wrong
      end
    end
  end
end
