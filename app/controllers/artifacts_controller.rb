class ArtifactsController < ApplicationController

  def index
    @artifacts = current_user.artifacts
  end

  def new
    @artifact = current_user.artifacts.build
  end

  def create
    current_user.artifacts.create!(artifact_params)
    flash[:notice] = 'Artifact created.'
    redirect_to action: :index
  end 

  def edit
    @artifact = current_user.artifacts.find_by!(slug: params[:slug])
  end

  def update
    @artifact = current_user.artifacts.find_by!(slug: params[:slug])
    @artifact.update!(artifact_params)
    flash[:notice] = 'Artifact updated.'
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid => invalid
    @artifact = invalid.full_messages
    render :edit
  end

  private
  
  def artifact_params
    params.require(:artifact).permit(:name, :content)
  end
end
