class TransactionsController < ApplicationController
  before_action :persist_query_params, :set_transaction

  def index
  end

  def edit
    render :index
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to transactions_url, notice: 'Transaction was successfully created.'
    else
      render :index
    end
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to transactions_url, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  private

  def persist_query_params
    @account_id = params[:account_id] || session[:account_id] || Account.first.id
    @month = params[:month] || session[:month] || Date.today.last_month.to_s.first(7)
    @date = Date.new(@month.first(4).to_i, @month.last(2).to_i, 15)
    @kind = find_transaction_kind

    session[:account_id] = @account_id
    session[:month] = @month
    session[:kind] = @kind
  end

  def find_transaction_kind
    if @account_id == session[:account_id]
      params[:kind] || session[:kind] || 'expense'
    else
      'expense'
    end
  end

  def set_transaction
    @transaction = params[:id] ?
                       Transaction.find(params[:id]) :
                       Transaction.new(
                           date: @date,
                           account_id: @account_id,
                           kind: @kind
                       )
    @transactions = @transaction.account.all_transactions.in_the_month_of(@date)
  end

  def transaction_params
    params.require(:transaction).permit(:date, :category, :amount, :comments, :kind, :account_id, :related_account_id)
  end
end
