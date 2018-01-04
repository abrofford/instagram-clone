require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "should not be able to save without required fields" do
    photo = Photo.new
    assert_not photo.save
  end

  test "should save a photo with all attributes" do
    user = users(:don)
    photo = Photo.new
    photo.user = user
    assert photo.save 
  end
end
