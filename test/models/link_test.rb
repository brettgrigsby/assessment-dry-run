require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  test "is valid" do
    link = Link.new(url: "https://www.google.com/")
    assert link.valid?
  end

  test "is invalid without proper url" do
    link = Link.new(url: nil)
    refute link.valid?

    link = Link.new(url: "billy")
    refute link.valid?
  end

  test "defaults to false for read value" do
    link = Link.new(url: "https://www.google.com/")
    assert_equal false, link.read
  end

end
