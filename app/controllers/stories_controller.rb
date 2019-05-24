class StoriesController < ApplicationController

  def index
    @stories = Story.all
    stories_with_parent_id = @stories.map(&:add_parent_id)
    render json: stories_with_parent_id
  end

  def create
    story_params = {
        title: params[:title],
        summary: params[:text],
    }
    @story = Story.new(story_params)

    if @story.save

      page_params = {
          name: params[:title],
          text: params[:text],
          story_id: @story.id,
          parent_id: nil
      }
      @page = Page.new(page_params)
      @page.save

      render json: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:title, :summary)
  end


end

