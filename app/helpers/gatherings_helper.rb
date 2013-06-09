module GatheringsHelper

  def gathering_kind_css_class(gathering)
    "kind-#{gathering.kind.parameterize}"
  end

  def gathering_kind_icon(gathering)
    basepath = "gathering_kind_icons/#{gathering.kind.parameterize}"
    svg(image_path("#{basepath}.svg"), fallback: "#{basepath}.png")
  end

end