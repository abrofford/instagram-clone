require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not be able to save without required fields" do
    comment = Comment.new
    assert_not comment.save
  end

  test "should save a photo with all attributes" do
    user = users(:nik)
    photo = photos(:photo_one)
    comment = Comment.new
    comment.photo = photo
    comment.body = "This is the test body"
    comment.user = user
    assert comment.save
  end
end
