require 'test_helper'
require 'json'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "stories show" do
    get '/api/stories'
    result_hash = JSON.parse(response.body)
    assert (result_hash[0]["title"] == 'MyString')
    assert (result_hash[0]["parentId"] == nil)
  end

  test "stories save" do
    post "/api/stories",
         params: { title: "new story title", summary: "new story text" }
    assert_response :success

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:title, :summary)
  end

end
