class PhotosController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def upload
    @uploader = AvatarUploader.new

    @uploader.store!('http://animalia-life.com/dogs.html')

    @uploader.retrieve_from_store!('http://animalia-life.com/dogs.html')
  end

  def index
    @pictures = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @picture.save
        format.html do
          redirect_to(
            @photo,
            notice: "We recommend cropping to: ")
          )
        end
        # format.json { render :show, status: :created, location: @photo}
      else
        # format.html { render :new }
        # format
      end
    end
  end


  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params[:photo].permit(:photo)
  end
end
