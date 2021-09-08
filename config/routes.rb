Rails.application.routes.draw do
  
  scope module: 'public' do
    root :to => 'homes#top'
    get 'about' => 'homes#about'
    get 'end_users/mypage' => 'end_users#show', as: 'end_user'
    get 'end_users/mypage/edit' => 'end_users#edit', as: 'edit_end_user'
    patch 'end_users/mypage' => 'end_users#update'
    get 'end_users/unsubscribe' => 'end_users#unsubscribe', as: 'unsubscribe'
    patch 'end_users/withdraw' => 'end_users#withdraw', as: 'withdraw'
    devise_for :end_users, controllers: {
      sessions: 'public/end_users/sessions',
      registrations: 'public/end_users/registrations'
    }
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :create, :destroy]
  end
  
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :artists, only: [:index, :create, :edit, :update, :destroy]
    resources :labels, only: [:index, :create, :edit, :update, :destroy]
    resources :items, except: [:destroy]
    resources :discs, except: [:index, :destroy]
    resources :songs, except: [:index, :destroy]
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
