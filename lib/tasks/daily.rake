task :clear_day do
  p "Clearing daily comic cache"
  ActionController::Base.new.expire_fragment(:controller => 'comics', :action => 'index')
end
