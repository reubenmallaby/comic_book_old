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
end
