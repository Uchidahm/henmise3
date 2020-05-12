Rails.application.routes.draw do
  resources :maps
  get 'avators/new'
  post 'avators' => 'avators#create'

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :submits do
    resources :likes, only: [:create, :destroy]
  end

  resources :mypages




  get 'tops' => 'tops#index'
  root 'submits#index'

end
