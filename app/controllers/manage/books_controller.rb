class Manage::BooksController < Manage::BaseController

  def index
    @books = Book.all
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
    @book = Book.new(params[:book])
    if @book.save
      redirect_to [:manage, @book], notice: 'Book was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to [:manage, @book], notice: 'Book was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to manage_books_url
  end
end
