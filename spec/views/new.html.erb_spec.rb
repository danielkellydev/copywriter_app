require 'rails_helper'

RSpec.describe "copies/new", type: :view do
  before do
    assign(:copy, Copy.new) # assign a new Copy instance to the view
    render
  end

  it "displays the header 'Create a New Copy'" do
    expect(rendered).to have_selector('h1', text: 'Create a New Copy')
  end

  it "has a form for creating a copy" do
    assert_select "form[action=?][method=?]", copies_path, "post" do

      assert_select "input[name=?]", "copy[business_name]"
      assert_select "input[name=?]", "copy[industry]"
      assert_select "input[name=?]", "copy[target_market]"
      assert_select "input[name=?]", "copy[copy_location]"
      assert_select "input[name=?]", "copy[copy_purpose]"
      assert_select "input[name=?]", "copy[copy_tone]"

      assert_select "input[type=?]", "submit"
    end
  end
end