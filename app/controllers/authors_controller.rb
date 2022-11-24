class AuthorsController < ApplicationController
	def index
    @author = Author.all
  end

  def show
    @author = Author.find(params[:id])
    # @gender_list = {m: "Male", f: "Female"}
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

  private

  def author_params
    params.require(:author).permit(
      :name, :gender, :bio, :born, :died, :summary
    )
  end
end
