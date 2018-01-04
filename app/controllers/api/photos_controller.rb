module Api
  class PhotosController < ApplicationController

    def index
      #byebug
      @photos = Photo.all
    end

    def show
      @photo = Photo.find(params[:id])
    end
  end
end
