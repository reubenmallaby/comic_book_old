class PostsController < ApplicationController

  def index
    @page = params[:page] || 1
    @per = params[:per] || 10
    @posts = Post.paginate(:page => @page, :per_page => @per)
    respond_to do |format|
      format.html
      format.rss
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.rss
    end
  end

  def show_by_day
    @date = Date.parse "#{params[:day]}-#{params[:month]}-#{params[:year]}"
    @post = Post.where(:created_at => @date).first

    redirect_to posts_url unless @post
  end

end
