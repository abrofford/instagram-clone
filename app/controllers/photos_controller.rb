class PhotosController < ApplicationController
  before_action :authorize

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = Photo.create(photo_params)
    photo.user_id = session[:user_id]
    if photo.save
      redirect_to "/"
    else
      redirect_to "/"
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @comments = @photo.comments
  end

  def like
    photo = Photo.find(params[:photo_id])
    photo.upvote_by current_user
    redirect_to photo_path(photo.id)
  end

  def dislike
    photo = Photo.find(params[:photo_id])
    photo.downvote_by current_user
    redirect_to photo_path(photo.id)
  end

  # def destroy
  #   @user.photo = nil
  #   @user.save
  # end


  private
    def photo_params
      params.require(:photo).permit(:image_name, :image, :title)
    end

end
