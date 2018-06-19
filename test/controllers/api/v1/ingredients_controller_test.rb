require 'test_helper'

class Api::V1::IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_ingredients_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_ingredients_create_url
    assert_response :success
  end

end
