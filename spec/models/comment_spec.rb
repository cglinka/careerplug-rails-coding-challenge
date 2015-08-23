require 'rails_helper'

RSpec.describe Comment, type: :model do
    it "should be invalid without required parameters" do
    comment = Comment.new
    expect(comment).not_to be_valid
  end
end
