require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      netid: "MyString",
      user_name: "MyString",
      user_level: 1
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[netid]"

      assert_select "input[name=?]", "user[user_name]"

      assert_select "input[name=?]", "user[user_level]"
    end
  end
end
