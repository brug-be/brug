# Encoding: UTF-8
require "minitest_helper"

describe GatheringKind do

  it "has a list of all gathering kinds" do
    GatheringKind.all.wont_be_empty
  end

end