class ArtifactsController < ApplicationController

  def new
    @artifact = current_user.artifacts.build
  end

  def create
    current_user.artifacts.create!(artifact_params)
    redirect_to action: :index
  end 

  def index
    @artifacts = current_user.artifacts
  end

  private
  
  def artifact_param 
    params.require(:artifact).permit(:name, :content)
  end
end
