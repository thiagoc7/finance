module TransactionsHelper
  def nav_item(name, active)
    content_tag :li, class: 'nav-item' do
      link_to name.capitalize, params.merge(kind: name), class: link_class(name, active)
    end
  end

  def nav_link(name, active)
    link_to name.capitalize, params.merge(account_type: name), class: link_class(name, active)
  end

  def icon_for(kind, related = false)
    case kind
    when 'expense'
      'arrow-down'

    when 'revenue'
      'arrow-up'

    when 'transfer'
      related ? 'arrow-left' : 'arrow-right'

    when 'buy'
      related ? 'arrow-right' : 'arrow-left'

    when 'sell'
      related ? 'arrow-left' : 'arrow-right'
    end
  end

  private
  def link_class(name, active)
    "nav-link #{'active' if name == active}"
  end
end
