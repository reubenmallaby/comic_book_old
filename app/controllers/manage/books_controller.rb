class Manage::BooksController < Manage::BaseController

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:books])
    if @book.save
      redirect_to [:manage, @book], notice: 'Series was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:books])
      redirect_to [:manage, @book], notice: 'Series was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to manage_series_url
  end
end
