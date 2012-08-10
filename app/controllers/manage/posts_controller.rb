class Manage::PostsController < Manage::BaseController
  def index
    @page = params[:page] || 1
    @per = params[:per] || 10
    @posts = Post.paginate(:page => @page, :per_page => @per)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @post = Post.find(params[:id])
   if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to manage_posts_url
  end
end
