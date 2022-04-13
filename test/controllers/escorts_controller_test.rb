require "test_helper"

class EscortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escort = escorts(:one)
  end

  test "should get index" do
    get escorts_url, as: :json
    assert_response :success
  end

  test "should create escort" do
    assert_difference('Escort.count') do
      post escorts_url, params: { escort: { age: @escort.age, city: @escort.city, description: @escort.description, first_name: @escort.first_name, last_name: @escort.last_name, phone: @escort.phone, price: @escort.price, sex: @escort.sex, stars: @escort.stars, user_id: @escort.user_id, username: @escort.username } }, as: :json
    end

    assert_response 201
  end

  test "should show escort" do
    get escort_url(@escort), as: :json
    assert_response :success
  end

  test "should update escort" do
    patch escort_url(@escort), params: { escort: { age: @escort.age, city: @escort.city, description: @escort.description, first_name: @escort.first_name, last_name: @escort.last_name, phone: @escort.phone, price: @escort.price, sex: @escort.sex, stars: @escort.stars, user_id: @escort.user_id, username: @escort.username } }, as: :json
    assert_response 200
  end

  test "should destroy escort" do
    assert_difference('Escort.count', -1) do
      delete escort_url(@escort), as: :json
    end

    assert_response 204
  end
end
