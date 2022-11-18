class BookmarksController < ApplicationController
  before_action :set_list, only: %i[show new create edit update destroy]

  def index
    @bookmark = Bookmarks.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
 def destroy
    @bookmark = Bookmark.find(params[:list_id])
    @bookmark.destroy
    # No need for app/views/bookmarks/destroy.html.erb
    redirect_to bookmarks_path, status: :see_other
  end
  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:content, :rating)
  end
end
