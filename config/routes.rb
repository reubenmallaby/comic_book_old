ComicBook::Application.routes.draw do

  devise_for :users

  get 'profile',      :to => 'users#show',    :as => 'profile'
  get 'profile/edit', :to => 'users#edit',    :as => 'edit_profile'
  put 'profile',      :to => 'users#update',  :as => 'update_profile'

  get '/comic/:year/:month/:day', :to => 'comics#show_by_day', :as => 'archived'
  get '/blog/:year/:month/:day', :to => 'posts#show_by_day', :as => 'archived_blog'

  get '/archive', :to => 'comics#archive', :as => 'archive'
  get '/tagged/:tag', :to => 'comics#tagged', :as => 'tagged'

  post '/comments/:parent_type/:parent_id', :to => 'comments#create', :as => 'comment'

  resources :posts, :only => [:index, :show], :path => 'blog'
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
    resources :tags
  end

  root :to => 'comics#show'

end
