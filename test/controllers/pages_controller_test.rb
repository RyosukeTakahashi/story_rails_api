require 'test_helper'
require 'json'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "show story" do

    page_id = Page.all[0].id

    get "http://localhost:3001/api/stories/1/pages/#{page_id}"
    result_hash = JSON.parse(response.body)
    assert (result_hash["name"] == "MyString")
  end
end
