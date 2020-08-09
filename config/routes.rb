Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :events do
    get 'apply_members', :on => :member
    get 'complete', :on => :collection
  end
  resources :users, only: [:index, :show]
  resources :applies, only: [:create, :destroy] do
    patch :toggle_status
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  devise_scope :user do
    authenticated :user do
      root :to => 'events#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
