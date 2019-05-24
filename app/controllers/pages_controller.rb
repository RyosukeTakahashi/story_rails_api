class PagesController < ApplicationController

  def show_page_in_story
    @page = Page.where(story_id: params[:story_id]).where(id: params[:page_id])[0]
    render json: @page
  end

end
