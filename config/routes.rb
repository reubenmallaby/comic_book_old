ComicBook::Application.routes.draw do
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
