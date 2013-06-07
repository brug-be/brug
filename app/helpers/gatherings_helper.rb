module GatheringsHelper

  def gathering_kind_css_class(gathering)
    "kind-#{gathering.kind.parameterize}"
  end

  def gathering_kind_icon(gathering)
    svg(image_path("gathering_kind_icons/#{gathering.kind.parameterize}.svg"))
  end

end