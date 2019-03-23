require 'test_helper'

class ClassfieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classfield = classfields(:one)
  end

  test "should get index" do
    get classfields_url
    assert_response :success
  end

  test "should get new" do
    get new_classfield_url
    assert_response :success
  end

  test "should create classfield" do
    assert_difference('Classfield.count') do
      post classfields_url, params: { classfield: { agency: @classfield.agency, bedrooms: @classfield.bedrooms, construction_date: @classfield.construction_date, district_area: @classfield.district_area, energy_ratio: @classfield.energy_ratio, full_description: @classfield.full_description, offer_id: @classfield.offer_id, offer_type: @classfield.offer_type, offer_view_count: @classfield.offer_view_count, origin: @classfield.origin, price: @classfield.price, rooms_count: @classfield.rooms_count, size: @classfield.size, url: @classfield.url } }
    end

    assert_redirected_to classfield_url(Classfield.last)
  end

  test "should show classfield" do
    get classfield_url(@classfield)
    assert_response :success
  end

  test "should get edit" do
    get edit_classfield_url(@classfield)
    assert_response :success
  end

  test "should update classfield" do
    patch classfield_url(@classfield), params: { classfield: { agency: @classfield.agency, bedrooms: @classfield.bedrooms, construction_date: @classfield.construction_date, district_area: @classfield.district_area, energy_ratio: @classfield.energy_ratio, full_description: @classfield.full_description, offer_id: @classfield.offer_id, offer_type: @classfield.offer_type, offer_view_count: @classfield.offer_view_count, origin: @classfield.origin, price: @classfield.price, rooms_count: @classfield.rooms_count, size: @classfield.size, url: @classfield.url } }
    assert_redirected_to classfield_url(@classfield)
  end

  test "should destroy classfield" do
    assert_difference('Classfield.count', -1) do
      delete classfield_url(@classfield)
    end

    assert_redirected_to classfields_url
  end
end
