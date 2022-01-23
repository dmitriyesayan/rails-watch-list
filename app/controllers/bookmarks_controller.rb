class BookmarksController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(params[:list_id])
    elsif !Movie.exists?(params[:bookmark]["movie_id"])
      flash[:error] = "Movie doesn't exist"
      render :new
    else
      @list = List.find(params[:list_id])
      prybug.pry
      render :new
    end
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def show
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to(request.env['HTTP_REFERER'])
  end


  def bookmark_params
    {
      movie_id: params.require(:bookmark).permit(:movie_id, :comment)["movie_id"],
      comment: params.require(:bookmark).permit(:movie_id, :comment)["comment"],
      list_id: params.require(:list_id)
    }
  end

end
