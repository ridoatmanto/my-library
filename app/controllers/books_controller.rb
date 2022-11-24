class BooksController < ApplicationController
	def index
    if params[:year].present?
      # pass variable example: &year[]=1950&year[]=1978
      return @books = Book.filter_by_year(params[:year]).paginate(:page => params[:page], :per_page => 10) 
    end

    if params[:author_id].present?
      # pass variable example: &author_id[]=1&author_id[]=2
      return @books = Book.filter_by_author_id(params[:author_id]).paginate(:page => params[:page], :per_page => 10) 
    end
    #   @books = Book.where(nil)
    #   @books = @books.filter_by_author_id(params[:author_id]) if params[:author_id].present?
    #   @books = @books.filter_by_year(params[:year]) if params[:year].present?
    #   @books = @books.filter_by_minimum_book_page(params[:min_page]) if params[:min_page].present?
    #   @books = @books.filter_by_maximum_book_page(params[:max_page]) if params[:max_page].present?
    #   return @books.paginate(:page => params[:page], :per_page => 10)
    # end
    # @books = Book.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to(root_url, :notice => 'Book not found')
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
