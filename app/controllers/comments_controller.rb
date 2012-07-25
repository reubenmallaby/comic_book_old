class CommentsController < ApplicationController
  before_filter :authorize

  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to @comment.comic, notice: 'Thank you for your comment.' }
      else
        format.js
        format.html { render action: "new" }
      end
    end
  end

end
