require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @review = reviews(:one)
  end

  test "visiting the index" do
    visit reviews_url
    assert_selector "h1", text: "Reviews"
  end

  test "should create review" do
    visit reviews_url
    click_on "New review"

    fill_in "Appuser netid", with: @review.user_netid
    fill_in "Candidate", with: @review.candidate_id
    fill_in "Review", with: @review.review_id
    fill_in "Review info", with: @review.review_info
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "should update Review" do
    visit review_url(@review)
    click_on "Edit this review", match: :first

    fill_in "Appuser netid", with: @review.user_netid
    fill_in "Candidate", with: @review.candidate_id
    fill_in "Review", with: @review.review_id
    fill_in "Review info", with: @review.review_info
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "should destroy Review" do
    visit review_url(@review)
    click_on "Destroy this review", match: :first

    assert_text "Review was successfully destroyed"
  end
end
