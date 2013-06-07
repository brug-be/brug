require "minitest_helper"

describe GatheringsHelper do

  include ActionView::TestCase::Behavior

  describe "gathering_kind_css_class" do

    it "returns a string usable as a CSS class" do
      gathering_kind_css_class(Gathering.new(kind:"user group")).must_equal "kind-user-group"
    end

  end

end