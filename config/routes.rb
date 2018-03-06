Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'decks#index'
  
  resources :decks, only: [:index, :show, :new, :create] do
    member do
      get :repeat
    end

    resources :cards, only: [:show, :new, :edit, :create, :update] do
      member do
        get :answer
        post :right
        post :wrong
        post :next
      end
    end
  end
end
