ComicBook::Application.routes.draw do

  get 'profile',      :to => 'users#show',    :as => 'profile'
  get 'profile/edit', :to => 'users#edit',    :as => 'edit_profile'
  post 'profile',     :to => 'users#update',  :as => 'update_profile'

  get '/comic/:year/:month/:day', :to => 'comics#show_by_day', :as => 'archived'

  get '/archive', :to => 'comics#archive', :as => 'archive'

  match '/comments/:parent_type/:parent_id', :to => 'comments#create', :as => 'comment'

  resources :posts, :only => [:index, :show]
  resources :comics, :only => [:index, :show] do

  end
  resources :books, :only => [:index, :show] do
    resources :comics, :only => [:index, :show]
  end

  namespace :manage do
    resources :books
    resources :comics
    resources :users
    resources :posts
  end

  root :to => 'comics#show'

end
