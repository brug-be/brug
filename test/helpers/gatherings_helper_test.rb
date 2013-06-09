require "minitest_helper"

describe GatheringsHelper do

  include ApplicationHelper

  describe "gathering_kind_css_class" do

    it "returns a string usable as a CSS class" do
      gathering_kind_css_class(Gathering.new(kind:"user group")).must_equal "kind-user-group"
    end

  end

  describe "gathering_kind_icon" do

    before do
      @gathering = Gathering.new(kind: "drinkup")
    end

    it "returns HTML markup to embed an SVG" do
      gathering_kind_icon(@gathering).must_match /\<object.*drinkup\.svg/
    end

    it "includes an image as fallback for browser which do not support SVG" do
      gathering_kind_icon(@gathering).must_match /drinkup\.png/
    end

  end

end