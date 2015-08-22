class BuildsController < ApplicationController

  def index
    @builds = Build.all 
  end

  def new
    @build ||= Build.new
  end

  def create
    params[:build][:link] = S3Helper.upload(params[:build][:file], random_token)
    params[:build][:slug] = random_token

    @build = Build.new(params.require(:build).permit(:slug, :title, :description, :link))

    if @build.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @build = Build.find_by_slug params[:id]
  end

  def show_xml
    @build = Build.find_by_slug params[:slug]
    render "builds/show_xml", mime_type: "text/xml", layout: nil
  end

  def destroy
    Build.find_by_slug(params[:slug]).destroy
  end

  private 

  def random_token
    SecureRandom.urlsafe_base64(16)
  end
end
