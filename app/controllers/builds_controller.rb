class BuildsController < ApplicationController

  def index
    @builds = Build.all 
  end

  def new
    @build ||= Build.new
  end

  def create
    S3Helper.upload(params[:build][:file], random_token)
    params[:build][:slug] = random_token

    @build = Build.new(params.require(:build).permit(:slug, :title, :description))

    if @build.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @build = Build.find_by_slug params[:id]
  end

  def destroy
    Build.find_by_slug(params[:slug]).destroy
  end

  private 

  def random_token
    SecureRandom.urlsafe_base64(16)
  end
end
