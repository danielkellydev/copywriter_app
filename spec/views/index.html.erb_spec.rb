require 'rails_helper'

RSpec.describe "copies/index", type: :view do
  context "with copies" do
    let(:user) { create(:user) }
    let!(:copies) { create_list(:copy, 3, user: user) }  # Create a list of 3 copies

    before do
      assign(:copies, copies)
      render
    end

    it "displays the heading 'Your Copies'" do
      expect(rendered).to have_selector('h1', text: 'Your Copies')
    end

    it "displays each copy's details" do
      copies.each do |copy|
        expect(rendered).to have_content(copy.business_name)
        expect(rendered).to have_content(copy.industry)
        expect(rendered).to have_content(copy.target_market)
        # ... Add other fields as needed
      end
    end

    it "displays a delete link for each copy" do
      copies.each do |copy|
        expect(rendered).to have_link('Delete', href: copy_path(copy))
      end
    end

    it "has a link to create a new copy" do
      expect(rendered).to have_link('Create New Copy', href: new_copy_path)
    end
  end

  context "without copies" do
    before do
      assign(:copies, [])
      render
    end

    it "displays a message indicating no copies" do
      expect(rendered).to have_content("You haven't made any copies yet.")
    end
  end
end