require 'test_helper'
require 'json'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "show page" do

    page_id = Page.all[0].id

    get "http://localhost:3001/api/stories/1/pages/#{page_id}"
    result_hash = JSON.parse(response.body)
    assert (result_hash["name"] == "MyString")
  end

  test "stories save" do
    page_name = "new page name"
    post "/api/stories/2/pages/3/next",
         params: { name: page_name, text: "new page text", story_id: 1, parent_id: nil}
    assert_response :success
    page_id = JSON.parse(response.body)["id"]
    get "http://localhost:3001/api/stories/2/pages/#{page_id}"
    result_hash = JSON.parse(response.body)
    assert (result_hash["name"] == page_name)
  end

end
