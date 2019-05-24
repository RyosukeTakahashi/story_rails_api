class StoriesController < ApplicationController

  def index
    @stories = Story.all
    stories_with_parent_id = @stories.map(&:add_parent_id)
    render json: stories_with_parent_id
  end

end

