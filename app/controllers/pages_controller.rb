class PagesController < ApplicationController

  def show_page_in_story
    @page = Page.where(story_id: params[:story_id]).where(id: params[:page_id])[0]
    render json: @page
  end

  def save_page_in_story
    page_params = {
        name: params[:name],
        text: params[:text],
        story_id: params[:story_id],
        parent_id: params[:parent_id]
    }
    @page = Page.new(page_params)
    if @page.save
      render json: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.require(:page).permit(:name, :text, :story_id, :parent_id)
  end


end
