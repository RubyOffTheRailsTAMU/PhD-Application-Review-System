require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      user_netid: "User Netid",
      user_name: "User Name",
      user_level: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User Netid/)
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/2/)
  end
end
