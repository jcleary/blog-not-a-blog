class ArtifactsController < ApplicationController

  def new
    @artifact = current_user.artifacts.build
  end
end
