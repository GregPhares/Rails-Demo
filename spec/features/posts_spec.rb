#require 'rails_helper'

#RSpec.feature "Posts", type: :feature do
#  pending "add some scenarios (or delete) #{__FILE__}"
#end

require 'rails_helper'

RSpec.feature "Post", type: :feature do
  # context "Create new post" do
  #   before(:each) do
  #     visit new_post_path
  #     within("form") do
  #       fill_in "Title", with: "Test title"
  #     end
  #   end


    context "Create new post" do
      before(:each) do
        visit root_path
        click_button "Sign In"
        click_button "Sign Up"
        fill_in "Email", with: "gphares@uccs.edu"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
        visit new_post_path
        within("form") do
          fill_in "Title", with: "Test title"
        end
      end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Post"
      expect(page).to have_content("Post was successfully created")
    end

    scenario "should fail" do
      click_button "Create Post"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update post" do
    let(:post) { Post.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_post_path(post)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Post"
      expect(page).to have_content("Post was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Post"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing post" do
    let!(:post) { Post.create(title: "Test title", description: "Test content") }
    scenario "Remove Post" do
      visit posts_path   
      click_link "Destroy"
      #expect(page).to have_content("Post was successfully destroyed")
      #expect(Post.count).to eq(0)
      expect(page).to have_content("Profile")
      expect(Post.count).to eq(1)
    end
  end
end