class ArtifactsController < ApplicationController

  before_action :find_user
  before_action :find_artifact, only: [:show, :edit, :update]

  def index
    @artifacts = @user.artifacts
  end

  def new
    @artifact = current_user.artifacts.build
  end

  def create
    current_user.artifacts.create!(artifact_params)
    flash[:notice] = 'Artifact created.'
    redirect_to action: :index
  end 

  def show
  end

  def edit
  end

  def update
    @artifact.update!(artifact_params)
    flash[:notice] = 'Artifact updated.'
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid => invalid
    @artifact = invalid.full_messages
    render :edit
  end

  private

  def find_user
    @user = User.find_by!(username: params[:username])
  end
  
  def find_artifact
    @artifact = @user.artifacts.find_by!(slug: params[:slug])
  end

  def artifact_params
    params.require(:artifact).permit(:name, :content)
  end
end
