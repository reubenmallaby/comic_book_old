ComicBook::Application.routes.draw do

  get 'profile',      :to => 'users#show',    :as => 'profile'
  get 'profile/edit', :to => 'users#edit',    :as => 'edit_profile'
  put 'profile',      :to => 'users#update',  :as => 'update_profile'

  get '/comic/:year/:month/:day', :to => 'comics#show_by_day', :as => 'archived'

  get '/archive', :to => 'comics#archive', :as => 'archive'

  post '/comments/:parent_type/:parent_id', :to => 'comments#create', :as => 'comment'

  resources :posts, :only => [:index, :show]
  resources :comics, :only => [:index, :show]

  resources :books, :only => [:index, :show] do
    resource :chapters, :only => [:index, :show] do
      resources :comics, :only => [:index, :show]
    end
    resources :comics, :only => [:index, :show]
  end

  namespace :manage do
    get 'settings', :to => 'settings#show', :as => 'settings'
    post 'settings', :to => 'settings#update'
    resources :books
    resources :chapters
    resources :comics
    resources :users
    resources :posts
  end

  root :to => 'comics#show'

end
