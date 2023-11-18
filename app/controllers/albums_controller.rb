# forzen_string_literal: true

class AlbumsController < ApplicationController
  def index
    if flash[:new_album_id]
      @new_album = Album.find_by(id: flash[:new_album_id])
    end
    @albums = Album.all.page(params.fetch(:page, 1)).per(5)
    if params[:order].present?
      @albums = @albums.order({ params[:order] => params[:direction] })
    end
    @album = Album.new
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:new_album_id] = @album.id
      redirect_back(
        fallback_location: albums_path
      )
    else
      render :create
    end
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_back(fallback_location: albums_path)
    else
      render :create
    end
  end

  def destroy
    @album = Album.find(params[:id])

    @album.destroy

    redirect_to tables_path
  end

  private

  def album_params
    params.require(:album).permit(
      :artist, :name, :release_date, :sales, :stars
    )
  end
end
