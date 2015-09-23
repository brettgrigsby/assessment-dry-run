class LinksController < ApplicationController

  def create
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.save
      flash[:notice] = "link added!"
    else
      flash[:warning] = "invalid link!"
    end
    redirect_to current_user
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

end
