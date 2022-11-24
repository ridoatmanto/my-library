class BooksController < ApplicationController
def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(
    	:title, :year, :plot, :copyright,
    	:description, :language, :release_date, :cover,
    	:summary, :classes)
  end
end
