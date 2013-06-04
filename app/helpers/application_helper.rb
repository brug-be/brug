module ApplicationHelper
  def participations_link_for gathering
    case
    when current_member && gathering.members.include?(current_member)
      link_to "I'm out", [gathering, :leave], class: 'call-to-action'
    else
      link_to "I'll be there!", [gathering, :join], class: 'call-to-action'
    end
  end

  def participation(gathering)
    if (gathering.members_count == 0)
      'No one is attending yet'
    else
      "#{pluralize(gathering.members_count, 'person')} attending"
    end
  end
end
