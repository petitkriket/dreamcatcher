require "application_system_test_case"

class ClassfieldImagesTest < ApplicationSystemTestCase
  setup do
    @classfield_image = classfield_images(:one)
  end

  test "visiting the index" do
    visit classfield_images_url
    assert_selector "h1", text: "Classfield Images"
  end

  test "creating a Classfield image" do
    visit classfield_images_url
    click_on "New Classfield Image"

    fill_in "Classfield", with: @classfield_image.classfield
    fill_in "Url", with: @classfield_image.url
    click_on "Create Classfield image"

    assert_text "Classfield image was successfully created"
    click_on "Back"
  end

  test "updating a Classfield image" do
    visit classfield_images_url
    click_on "Edit", match: :first

    fill_in "Classfield", with: @classfield_image.classfield
    fill_in "Url", with: @classfield_image.url
    click_on "Update Classfield image"

    assert_text "Classfield image was successfully updated"
    click_on "Back"
  end

  test "destroying a Classfield image" do
    visit classfield_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Classfield image was successfully destroyed"
  end
end
