class Post < ApplicationRecord
    validates_presence_of :title, :description
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    def should_generate_new_friendly_id?
        title_changed?
    end
end


#require "rails_helper"
#
#RSpec.describe Post, type: :model do
#  # ...
#
#  context "scopes tests" do
#    let(:params) { { title: "Title", description: "some description" } }
#    before(:each) do
#      Post.create(params)
#      Post.create(params)
#      Post.create(params)
#    end
#
#    it "should return all projects" do
#      expect(Post.count).to eq(3)
#    end
#
#  end
#end