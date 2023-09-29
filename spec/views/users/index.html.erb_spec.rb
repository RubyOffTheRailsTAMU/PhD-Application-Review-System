require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        user_netid: "User Netid",
        user_name: "User Name",
        user_level: 2
      ),
      User.create!(
        user_netid: "User Netid",
        user_name: "User Name",
        user_level: 2
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("User Netid".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("User Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end