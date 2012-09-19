class BooksController < ApplicationController

  # GET /books
  # GET /books.json
  def index
    @book = Book.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @book }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @book }
    end
  end

end
