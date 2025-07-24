class BudgetNotifier < Noticed::Event
  required_param :budget

  def message
    "warning: Your budget is pverspent by Rs #{params[:budget].remaining}."
  end

  def url
    Rails.application.routes.url_helpers.couples_budget_path
  end
end
