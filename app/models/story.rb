class Story < ApplicationRecord

  def add_parent_id
    story_data = self.attributes
    puts story_data[:id]
    story_data.store('parentId', self.get_newest_page_id(story_data['id']))
    story_data
  end

  def get_newest_page_id(story_id)
    Page.where(story_id: story_id).minimum(:id)
  end

end
