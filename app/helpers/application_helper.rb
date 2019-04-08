module ApplicationHelper
  def account_dropdown
    result = []
    Account.all.order(:kind, :name).each do |account|
      result << [account.dropdown_name, account.id]
    end
    result
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
