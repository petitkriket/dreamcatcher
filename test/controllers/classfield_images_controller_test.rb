require 'test_helper'

class ClassfieldImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classfield_image = classfield_images(:one)
  end

  test "should get index" do
    get classfield_images_url
    assert_response :success
  end

  test "should get new" do
    get new_classfield_image_url
    assert_response :success
  end

  test "should create classfield_image" do
    assert_difference('ClassfieldImage.count') do
      post classfield_images_url, params: { classfield_image: { classfield: @classfield_image.classfield, url: @classfield_image.url } }
    end

    assert_redirected_to classfield_image_url(ClassfieldImage.last)
  end

  test "should show classfield_image" do
    get classfield_image_url(@classfield_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_classfield_image_url(@classfield_image)
    assert_response :success
  end

  test "should update classfield_image" do
    patch classfield_image_url(@classfield_image), params: { classfield_image: { classfield: @classfield_image.classfield, url: @classfield_image.url } }
    assert_redirected_to classfield_image_url(@classfield_image)
  end

  test "should destroy classfield_image" do
    assert_difference('ClassfieldImage.count', -1) do
      delete classfield_image_url(@classfield_image)
    end

    assert_redirected_to classfield_images_url
  end
end
