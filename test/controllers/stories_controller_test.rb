require 'test_helper'
require 'json'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "stories" do
    get 'http://localhost:3001/api/stories'
    result_hash = JSON.parse(response.body)
    assert (result_hash[0]["title"] == 'MyString')
    assert (result_hash[0]["parentId"] == nil)
  end
end
