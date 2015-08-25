class BuildsController < ApplicationController

  def index
    @builds = Build.paginate(page: params[:page], per_page: 12).order('created_at DESC')
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

  def show_xml
    @build = Build.find_by_slug params[:id]
    render "builds/show_xml", mime_type: "text/xml", layout: nil
  end

  private 

  def random_token
    SecureRandom.urlsafe_base64(16)
  end
end
