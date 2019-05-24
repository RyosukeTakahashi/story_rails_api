class SaveStory
  def save
    story = Story.new
    story.title = "new story"
    story.summary = "new summary"
    story.save
  end
end

class SavePage
  def save
    story = Page.new
    story.name = "new page name"
    story.text = "new page text"
    story.story_id = 1
    story.parent_id = nil
    story.save
  end
end

story = SaveStory.new
story.save
p "story saved"
