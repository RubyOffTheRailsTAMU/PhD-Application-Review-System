require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      netid: "MyString",
      review_id: 1,
      review_info: "MyString",
      created_at: "MyString",
      updated_at: "MyString"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input[name=?]", "review[netid]"

      assert_select "input[name=?]", "review[review_id]"

      assert_select "input[name=?]", "review[review_info]"

      assert_select "input[name=?]", "review[created_at]"

      assert_select "input[name=?]", "review[updated_at]"
    end
  end
end
