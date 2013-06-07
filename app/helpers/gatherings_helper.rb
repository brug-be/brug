module GatheringsHelper

  def gathering_kind_css_class(gathering)
    "kind-#{gathering.kind.parameterize}"
  end

end