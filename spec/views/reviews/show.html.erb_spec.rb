require 'rails_helper'

RSpec.describe "reviews/show", type: :view do
  before(:each) do
    assign(:review, Review.create!(
      netid: "Netid",
      review_id: 2,
      review_info: "Review Info",
      created_at: "Created At",
      updated_at: "Updated At"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Netid/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Review Info/)
    expect(rendered).to match(/Created At/)
    expect(rendered).to match(/Updated At/)
  end
end