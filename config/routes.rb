ComicBook::Application.routes.draw do

  get 'profile',      :to => 'users#show',    :as => :profile
  get 'profile/edit', :to => 'users#edit',    :as => :edit_profile
  post 'profile',     :to => 'users#update',  :as => :update_profile

  get '/comic/:year/:month/:day', :to => 'comics#show_by_day', :as => :archived

  resources :comics, :only => [:index, :show] do
    resource :comments, :only => :create
  end
  resources :books, :only => [:index, :show] do
    resources :comics, :only => [:index, :show]
  end


  namespace :manage do
    resources :books
    resources :comics
    resources :users
  end

  root :to => 'comics#show'

end
