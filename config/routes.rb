ComicBook::Application.routes.draw do

  get 'profile',      :to => 'users#show',    :as => :profile
  get 'profile/edit', :to => 'users#edit',    :as => :edit_profile
  post 'profile',     :to => 'users#update',  :as => :update_profile

  get '/comic/:year/:month/:day', :to => 'comics#show_by_day'

  resources :comics, :only => [:index, :show]
  resources :series, :only => [:index, :show] do
    resources :comics, :only => [:index, :show]
  end

  namespace :manage do
    resources :comics
    resources :series do
      resources :comics
    end
    resources :users
  end

  root :to => 'comics#show'

end
