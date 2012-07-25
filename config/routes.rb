ComicBook::Application.routes.draw do

  get 'profile',      :to => 'users#show',    :as => :profile
  get 'profile/edit', :to => 'users#edit',    :as => :edit_profile
  post 'profile',     :to => 'users#update',  :as => :update_profile

  resources :comics
  resources :series do
    resources :comics, :only => [:index, :show]
  end

  namespace :manage do
    resources :comics
    resources :series do
      resources :comics, :only => [:index, :show]
    end
    resources :users
  end

  root :to => 'comics#index'

end
