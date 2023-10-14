require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      status: 1,
      user: nil,
      applicant: nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[status]"

      assert_select "input[name=?]", "task[user_id]"

      assert_select "input[name=?]", "task[applicant_id]"
    end
  end
end