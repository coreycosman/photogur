class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    @month_old = Picture.month_old(Time.now)

  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create

    @picture = Picture.new
    @picture.artist = params[:picture][:artist]
    @picture.title = params[:picture][:title]
    @picture.url = params[:picture][:url]
    if @picture.save
      redirect_to '/pictures'
    else
      render :new
    end
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.artist = params[:picture][:artist]
    @picture.title = params[:picture][:title]
    @picture.url = params[:picture][:url]

    if @picture.save
      redirect_to "pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end


end
