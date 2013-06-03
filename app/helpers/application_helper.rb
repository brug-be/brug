module ApplicationHelper
  def participations_link_for gathering
    case
    when current_member && gathering.members.include?(current_member)
      link_to "I'm out", [gathering, :leave], class: 'call-to-action'
    else
      link_to "I'll be there!", [gathering, :join], class: 'call-to-action'
    end
  end
end
