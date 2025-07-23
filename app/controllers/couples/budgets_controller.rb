class Couples::BudgetsController < ApplicationController
  before_action :set_budget, only: [:update]

  def show
    @couple = current_user.authenticatable
    @budget = @couple.budget || @couple.create_budget

    if @budget.present?
      @services = @budget.services
      @completed_appointments = @couple.appointments.completed.includes(:service)

      spent = @completed_appointments.sum { |a| a.service&.price }

      @budget.update(
        spent: spent,
        remaining: (@budget.total_budget || 0) - spent
      )

    else
      @services = []
      @completed_appointments = []
    end
  end

  def update
    if @budget.update(budget_params)
      @budget.update(remaining: @budget.total_budget - @budget.spent)

      respond_to do |format|
        format.turbo_stream do
            render turbo_stream: turbo_stream.replace(
              "budget_summary",
              partial: "couples/budgets/budget_summary",
              locals: { budget: @budget, edit_mode: false }
            )
          end


        format.html do
          redirect_to couples_budget_path, notice: "Budget updated successfully."
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "total_budget",
            partial: "couples/budgets/total_budget",
            locals: { budget: @budget }
          )
        end

        format.html do
          flash[:alert] = "Failed to update budget."
          render :show
        end
      end
    end
  end

  private

  def set_budget
    @couple = current_user.authenticatable
    @budget = @couple.budget
  end

  def budget_params
    params.require(:budget).permit(:total_budget)
  end
end
