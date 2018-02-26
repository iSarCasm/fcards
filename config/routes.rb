Rails.application.routes.draw do
  root 'decks#index'
  
  resources :decks, only: [:index, :show, :new, :create] do
    member do
      get :repeat
    end

    resources :cards, only: [:show, :new, :create] do
      member do
        get :answer
        post :right
        post :wrong
        post :next
      end
    end
  end
end
