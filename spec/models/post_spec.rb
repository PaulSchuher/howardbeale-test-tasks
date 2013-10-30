# spec/models/post.rb
require 'spec_helper'
describe Post do
  it "is invalid without title" do
    FactoryGirl.build(:post, title: nil).should_not be_valid
  end
  it "is can generate valid unique permalink" do
    3.times do
      post = FactoryGirl.build(:post)
      post.generate_permalink!
      post.save
      post.should be_valid
    end
  end
  it "is invalid with not unique permalink" do
    FactoryGirl.create(:post_with_permalink).should be_true
    FactoryGirl.build(:post_with_permalink).should_not be_valid
  end
  it "is invalid if permalink has wrong format" do
    FactoryGirl.build(:post_with_wrong_permalink).should_not be_valid
  end
end