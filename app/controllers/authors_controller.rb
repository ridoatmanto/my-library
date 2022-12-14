class AuthorsController < ApplicationController
	def index
    @authors = Author.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @author = Author.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to(root_url, :notice => 'Author not found')
  end

  def edit
    @author = Author.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to(root_url, :notice => 'Author not found')
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @author = Author.find(params[:id])

    @author.update(author_params)

    redirect_to author_path(@author)
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to author_path
  end

  private

  def author_params
    params.require(:author).permit(
      :name, :gender, :bio, :born, :died, :summary
    )
  end
end
