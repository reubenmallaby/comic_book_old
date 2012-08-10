class CommentsController < ApplicationController
  before_filter :authorize
  before_filter :get_parent_object

  def create
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable_type = params[:parent_type]
    @comment.commentable_id = params[:parent_id]
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to @comment.commentable, notice: 'Thank you for your comment.' }
      else
        format.js
        format.html { render action: "new" }
      end
    end
  end

  protected

  def get_parent_object
  #  @parent = case params[:parent_type]
  #    when 'Comic' then Comment.find params[:parent_id]
  #    when 'Post' then Post.find params[:parent_id]
  #    else nil
  #  end
  end

end
