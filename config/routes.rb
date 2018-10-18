Rails.application.routes.draw do
  resources :boards, only: %i[index show create update destroy] do
    resources :lists, only: %i[create update destroy]
  end

  resources :lists, only: [] do
    resources :cards, only: %i[new create]
  end
  resources :cards, only: %i[show update destroy] do
    resource :description, only: %i[edit update], module: :cards
    resources :movements, only: :create, module: :cards
    resources :messages, only: %i[new edit create update destroy]
  end

  root 'boards#index'
end
