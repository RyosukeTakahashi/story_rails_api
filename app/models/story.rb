class Story < ApplicationRecord

  def add_parent_id
    story_data = self.attributes
    story_data.store('parentId', self.get_newest_page_id(story_data['id']))
    story_data
  end

  def get_newest_page_id(story_id)
    Page.where(story_id: story_id).minimum(:id)
  end

  def change_key_name_to_snake_case(new_page_id)
    story_data = self.attributes
    story_data.store('storyId', story_data['id'])
    story_data.store('pageId', new_page_id)
    story_data
  end

end
