Rails.application.routes.draw do
  resources :dies, only: [:index, :new, :create]


  get 'dies/index'

  get 'notifications/index'

  get 'relationships/create'

  get 'relationships/destroy'

  get 'topics' => 'topics#index'
  root 'top#index'

# 意味
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: %i[index show]
  resources :relationships, only: %i[create destroy]
  resources :topics do
    resources :comments
    post :confirm, on: :collection
  end
  resources :conversations do
    resources :messages
  end


  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
