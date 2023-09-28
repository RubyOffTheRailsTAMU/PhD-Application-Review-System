require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        netid: "Netid",
        review_id: 2,
        review_info: "Review Info",
        created_at: "Created At",
        updated_at: "Updated At"
      ),
      Review.create!(
        netid: "Netid",
        review_id: 2,
        review_info: "Review Info",
        created_at: "Created At",
        updated_at: "Updated At"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Netid".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Review Info".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Created At".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Updated At".to_s), count: 2
  end
end
