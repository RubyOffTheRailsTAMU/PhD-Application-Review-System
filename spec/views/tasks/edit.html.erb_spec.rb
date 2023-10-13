require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  let(:task) {
    Task.create!(
      status: 1,
      user: nil,
      applicant: nil
    )
  }

  before(:each) do
    assign(:task, task)
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(task), "post" do

      assert_select "input[name=?]", "task[status]"

      assert_select "input[name=?]", "task[user_id]"

      assert_select "input[name=?]", "task[applicant_id]"
    end
  end
end
