module TransactionsHelper
  def nav_item(name, active)
    content_tag :li, class: 'nav-item' do
      link_to name.capitalize, params.merge(transaction_type: name), class: link_class(name, active)
    end
  end

  def nav_link(name, active)
    link_to name.capitalize, params.merge(account_type: name), class: link_class(name, active)
  end

  private
  def link_class(name, active)
    "nav-link #{'active' if name == active}"
  end
end
