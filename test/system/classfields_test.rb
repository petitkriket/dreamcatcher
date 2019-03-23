require "application_system_test_case"

class ClassfieldsTest < ApplicationSystemTestCase
  setup do
    @classfield = classfields(:one)
  end

  test "visiting the index" do
    visit classfields_url
    assert_selector "h1", text: "Classfields"
  end

  test "creating a Classfield" do
    visit classfields_url
    click_on "New Classfield"

    fill_in "Agency", with: @classfield.agency
    fill_in "Bedrooms", with: @classfield.bedrooms
    fill_in "Construction date", with: @classfield.construction_date
    fill_in "District area", with: @classfield.district_area
    fill_in "Energy ratio", with: @classfield.energy_ratio
    fill_in "Full description", with: @classfield.full_description
    fill_in "Offer", with: @classfield.offer_id
    fill_in "Offer type", with: @classfield.offer_type
    fill_in "Offer view count", with: @classfield.offer_view_count
    fill_in "Origin", with: @classfield.origin
    fill_in "Price", with: @classfield.price
    fill_in "Rooms count", with: @classfield.rooms_count
    fill_in "Size", with: @classfield.size
    fill_in "Url", with: @classfield.url
    click_on "Create Classfield"

    assert_text "Classfield was successfully created"
    click_on "Back"
  end

  test "updating a Classfield" do
    visit classfields_url
    click_on "Edit", match: :first

    fill_in "Agency", with: @classfield.agency
    fill_in "Bedrooms", with: @classfield.bedrooms
    fill_in "Construction date", with: @classfield.construction_date
    fill_in "District area", with: @classfield.district_area
    fill_in "Energy ratio", with: @classfield.energy_ratio
    fill_in "Full description", with: @classfield.full_description
    fill_in "Offer", with: @classfield.offer_id
    fill_in "Offer type", with: @classfield.offer_type
    fill_in "Offer view count", with: @classfield.offer_view_count
    fill_in "Origin", with: @classfield.origin
    fill_in "Price", with: @classfield.price
    fill_in "Rooms count", with: @classfield.rooms_count
    fill_in "Size", with: @classfield.size
    fill_in "Url", with: @classfield.url
    click_on "Update Classfield"

    assert_text "Classfield was successfully updated"
    click_on "Back"
  end

  test "destroying a Classfield" do
    visit classfields_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Classfield was successfully destroyed"
  end
end
