class ResultsController < ApplicationController
  before_action :persist_query_params

  def index
    @result = Result.new(@begin_month, @end_month)
  end


  private
  def persist_query_params
    @begin_month = params[:begin_month] || session[:begin_month] || Date.today.last_month.last_month.to_s.first(7)
    @end_month = params[:end_month] || session[:month] || Date.today.last_month.to_s.first(7)

    session[:begin_month] = @begin_month
    session[:month] = @end_month
  end
end
