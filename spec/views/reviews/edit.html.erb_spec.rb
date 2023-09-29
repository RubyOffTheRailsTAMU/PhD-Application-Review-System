require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  let(:review) {
    Review.create!(
      review_id: 1,
      user_netid: "MyString",
      review_info: "MyString",
      created_at: "MyString",
      updated_at: "MyString"
    )
  }

  before(:each) do
    assign(:review, review)
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(review), "post" do

      assert_select "input[name=?]", "review[review_id]"

      assert_select "input[name=?]", "review[user_netid]"

      assert_select "input[name=?]", "review[review_info]"

      assert_select "input[name=?]", "review[created_at]"

      assert_select "input[name=?]", "review[updated_at]"
    end
  end
end
