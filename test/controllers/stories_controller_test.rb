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

end
