class Manage::TagsController < Manage::BaseController

  def index
    @page = params[:page] || 1
    @per = params[:per] || 10
    @tags = Tag.paginate(:page => @page, :per_page => @per)
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to manage_tags_url, notice: 'Tag was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @tag = Tag.find(params[:id])
   if @tag.update_attributes(params[:tag])
      redirect_to manage_tags_url, notice: 'Tag was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to manage_tags_url
  end
end
